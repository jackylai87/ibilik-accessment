class User < ActiveRecord::Base
	validates :email, uniqueness: true
	validates :password, length: { minimum: 6 }
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :bookings, dependent: :destroy
	has_secure_password
end