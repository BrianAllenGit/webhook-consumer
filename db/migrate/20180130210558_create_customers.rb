class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :date_of_birth

      t.integer :points_balance
      t.string :referral_url

      t.string :vip_tier

      t.timestamps
    end
  end
end
