class CreateItemInsideCarts < ActiveRecord::Migration
  def change
    create_table :item_inside_carts do |t|
      t.references :item, index: true, foreign_key: true
      t.references :cart, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
