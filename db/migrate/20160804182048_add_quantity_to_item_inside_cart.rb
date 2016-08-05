class AddQuantityToItemInsideCart < ActiveRecord::Migration
  def change
    add_column :item_inside_carts, :quantity, :integer
  end
end
