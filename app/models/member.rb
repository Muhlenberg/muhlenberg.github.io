class Member < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: {maximum: 25} #make sure model passes test before being added to db
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #i found this online
	validates :email, presence: true, length: { maximum: 50 }, 
	format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
end
