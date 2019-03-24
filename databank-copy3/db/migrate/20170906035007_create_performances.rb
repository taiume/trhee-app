class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.date :day
      t.integer :shop_id
      t.integer :wimax
      t.integer :uqm
      t.timestamps
    end
  end
end
