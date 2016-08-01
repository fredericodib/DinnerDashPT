class Item < ActiveRecord::Base
	mount_uploader :item_photo, ItemPhotoUploader

	has_and_belongs_to_many :categories
end
