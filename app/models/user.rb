class User < ActiveRecord::Base
	include RoleModel
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :roles, :email, :password, :password_confirmation, :remember_me
  
  roles_attribute :roles_mask

  has_many :fortunes, :dependent => :destroy
  has_many :comments, :dependent => :destroy
   
  roles :admin, :moderator, :author, :banned
end
