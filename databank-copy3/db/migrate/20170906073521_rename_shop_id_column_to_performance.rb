class RenameShopIdColumnToPerformance < ActiveRecord::Migration
  def change
    rename_column :performances, :shop_id, :shop_list_id
  end
end
