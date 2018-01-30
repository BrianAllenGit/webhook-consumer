class InboundWebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def receive
    puts "<<<<<<<<<<< PRODUCT CREATED WEBHOOK INITIATED >>>>>>>>>>>>>>>"
    puts params
    customer_params = params[:data].dig('customer')
    Customer.find_or_create_by!{
      first_name: customer_params.dig('first_name'),
      last_name: customer_params.dig('last_name'),
    ).tap do |customer|
      customer.email = customer_params.dig('email')
      customer.date_of_birth = customer_params.dig('date_of_birth')
      customer.points_balance = customer_params.dig('points_balance')
      customer.save!
    end
    status = rand(0..50) == 50 ?  rand(200..500) : 200
    render status: status, json: @controller.to_json
  end
end
