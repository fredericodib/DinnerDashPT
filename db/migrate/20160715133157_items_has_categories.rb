class ItemsHasCategories < ActiveRecord::Migration
  def change
  	create_join_table :items, :categories
  end
end
