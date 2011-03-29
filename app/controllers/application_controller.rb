class ApplicationController < ActionController::Base
  protect_from_forgery
  def set_contacts_notifications_and_status
    if user_signed_in?
     
      @user_id = current_user.id
    end
  end
  
  
end
