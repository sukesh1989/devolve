class Profile < ActiveRecord::Base
  belongs_to :user
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  
end
