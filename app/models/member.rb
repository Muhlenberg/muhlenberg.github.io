class Member < ActiveRecord::Base
	attr_accessor :remember_token

	before_save { self.email = email.downcase }
	validates :name, presence: true, length: {maximum: 25} #make sure model passes test before being added to db
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #i found this online
	validates :email, presence: true, length: { maximum: 50 }, 
	format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }

	# use short bcrypt for testing, normal for production
	def Member.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
		BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	def Member.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
		self.remember_token = Member.new_token
		update_attribute(:remember_token, Member.digest(remember_token))
	end

	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	def forget
		update_attribute(:remember_digest, nil)
	end
end
