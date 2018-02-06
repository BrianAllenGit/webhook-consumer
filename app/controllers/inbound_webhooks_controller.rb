class InboundWebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @customers = Customer.all
  end

  def receive
    status = rand(0..50) == 50 ?  rand(200..500) : 200
    if status != 200
      return render status: status, json: @controller.to_json
    end

    customer_params = params[:data].dig('customer')
    if customer_params.dig('is_test') == true
      return render status: status, json: @controller.to_json
    end

    Customer.find_or_create_by!(customer_id: customer_params.dig('id')).tap do |customer|
      customer.account_id = params[:account_id]
      customer.first_name = customer_params.dig('first_name')
      customer.last_name = customer_params.dig('last_name')
      customer.email = customer_params.dig('email')
      customer.date_of_birth = customer_params.dig('date_of_birth')
      customer.points_balance = customer_params.dig('points_balance')
      customer.vip_tier_id = customer_params.dig('vip_tier', 'id')
      customer.save!
    end
    render status: status, json: @controller.to_json
  end
end
