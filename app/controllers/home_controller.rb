class HomeController < ApplicationController
  before_filter :authenticate_user! ,:except => [:help]
  
  def index
      if (current_user.getting_started == true )
        redirect_to  home_gettingstarted_path
      else 
        render :index
  end
end
  def help
  end
  def gettingstarted
  end
  def getting_started_completed
    @user = current_user
    @user.update_attributes(:getting_started => false)
      redirect_to root_path
  end
end
