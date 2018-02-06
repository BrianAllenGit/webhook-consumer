class AddIndexToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_index :customers, :customer_id, unique: true
  end
end
