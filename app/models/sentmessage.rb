class Sentmessage < ActiveRecord::Base
  belongs_to :message
    belongs_to :recipient, :class_name => "User"
    belongs_to :folder
end
