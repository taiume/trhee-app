class CreateShopLists < ActiveRecord::Migration
  def change
    create_table :shop_lists do |t|
        t.string :name
    end
  end
end
