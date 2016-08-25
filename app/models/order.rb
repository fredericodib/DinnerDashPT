class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :cart
  belongs_to :order_status

  before_create :set_order_status

  def set_order_status
  	self.order_status_id = 1
  end
end
