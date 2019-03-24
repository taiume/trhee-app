class ChangetablePerformances < ActiveRecord::Migration
  def change
    add_column :performances,:ym_wifi,:integer
    add_column :performances,:sb_net,:integer
    add_column :performances,:sb_wifi,:integer
    add_column :performances,:au_net,:integer
    add_column :performances,:au_wifi,:integer
    add_column :performances,:do_net,:integer
    add_column :performances,:ym_phone,:integer
    add_column :performances,:sb_phone,:integer
    add_column :performances,:au_phone,:integer
    add_column :performances,:do_phone,:integer
  end
end
