class HomeController < ApplicationController
  before_filter :authenticate_user! ,:except => [:help]
  def create
    
    
 
    
    @user=User.find(current_user.id)
    @pro=Profile.new(:name=>params[:profile][:name],
    :birthdate=>params[:profile][:birthdate],
    :location=>params[:profile][:location],
    :bio=>params[:profile][:bio],
    :occupation=>params[:profile][:occupation],:gender=>params[:profile][:gender])
    
    @user.profile=@pro
    
     @user.update_attributes(:getting_started => false)
        redirect_to root_path
  end
  def index
     if (current_user.getting_started == true )
       @user=current_user.id
        redirect_to home_gettingstarted_path
      else 
        render :index
  end
end
  
  def help
  
  end
  


  def gettingstarted

      
  end
 

  def getting_started_completed
  
   
  end
end
