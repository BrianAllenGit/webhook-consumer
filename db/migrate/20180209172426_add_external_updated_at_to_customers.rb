class AddExternalUpdatedAtToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :external_updated_at, :date
  end
end
