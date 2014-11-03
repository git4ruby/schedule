class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
 #before_save :encrypt_password

	has_many :shifts

  	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates :email, uniqueness: true, presence: true
	#validates_presence_of :email
	#validates_uniqueness_of :email
	#validates_foreign_key :email
 

  def self.authenticate(email, password)
	user = find_by_email(email)
	if user && user.password == password
	   user
	end
  end  


 #def encrypt_password
 #if password.present?
 #	self.password_salt = Bcrypt::Engine.generate_salt
 #      self.password_hash = Bcrypt::Engine.hash_secret(password, password_salt) #end
 #end

end
