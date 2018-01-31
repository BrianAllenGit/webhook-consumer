class InboundWebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @customers = Customer.all
  end

  def receive
    customer_params = params[:data].dig('customer')
    Customer.find_or_create_by!(customer_id: customer_params.dig('id')).tap do |customer|
      customer.first_name = customer_params.dig('first_name')
      customer.last_name = customer_params.dig('last_name')
      customer.email = customer_params.dig('email')
      customer.date_of_birth = customer_params.dig('date_of_birth')
      customer.points_balance = customer_params.dig('points_balance')
      customer.vip_tier_id = customer.dig('vip_tier', 'id')
      customer.save!
    end
    status = rand(0..50) == 50 ?  rand(200..500) : 200
    render status: status, json: @controller.to_json
  end
end
