class HomeController < ApplicationController
  before_filter :authenticate_user! #,:except => [:index]
  
  def index
      if user_signed_in?
        render :index
      else  
          redirect_to new_user_session_path
    end

  end
 

end
