class AddPhotoToItem < ActiveRecord::Migration
  def change
    add_column :items, :item_photo, :string
  end
end
