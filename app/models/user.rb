class User < ActiveRecord::Base
  before_create :build_inbox

    def inbox
      folders.find_by_name("Inbox")
    end

    def build_inbox
      folders.build(:name => "Inbox")
    end
  has_many :sentmessages
  has_many :sent_messages, :class_name => "Message", :foreign_key => "author_id"
  has_many :received_messages, :class_name => "MessageCopy", :foreign_key => "recipient_id"
  has_many :folders
  has_many :commus
    has_many :memberships
  has_one :profile
    has_many :codes
    has_many :bookmarks
  has_many :microposts, :dependent => :destroy
  has_many :commus
  has_many :friendships 
  has_many :friends,:through => :friendships, :conditions => "status = 'accepted'"
  has_many :requested_friends, :through => :friendships,:source => :friend, :conditions => "status = 'requested'",
   :order => :created_at
  has_many :pending_friends, :through => :friendships,
  :source => :friend, :conditions => "status = 'pending'", :order => :created_at
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :invitable, :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable,:lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:getting_started,:lname,:fname,:name
  
  
  
  def feed
  Micropost.from_users_followed_by(self)
  end
end
