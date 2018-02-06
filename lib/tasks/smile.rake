namespace :smile do
  desc "Blow away the Customer table"
  task clear_customer_table: :environment do
    Customer.destroy_all
  end

end
