class AddAccountIdToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :account_id, :integer, index: true
  end
end
