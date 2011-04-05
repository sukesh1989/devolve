class User < ActiveRecord::Base
  has_one :profile
  
  has_many :friendships 
  has_many :friends,:through => :friendships, :conditions => "status = 'accepted'"
  has_many :requested_friends, :through => :friendships,:source => :friend, :conditions => "status = 'requested'",
   :order => :created_at
  has_many :pending_friends, :through => :friendships,
  :source => :friend, :conditions => "status = 'pending'", :order => :created_at
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable,:lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:getting_started,:lname,:fname
end
