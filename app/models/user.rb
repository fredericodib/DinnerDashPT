class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

	validates :full_name, presence: true
	validates :nickname, presence: true
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
	validates :password, presence: true, confirmation: true, length: { minimum: 4 }
	validates :password_confirmation, presence: true, length: { minimum: 4 }
	validates :nickname, uniqueness: true

	has_secure_password


	has_many :order

end

