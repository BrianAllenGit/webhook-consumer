class ChangeVipTierToVipTierId < ActiveRecord::Migration[5.1]
  def change
    remove_column :customers, :vip_tier
    add_column :customers, :vip_tier_id, :integer
  end
end
