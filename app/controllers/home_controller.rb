class HomeController < ApplicationController
  before_filter :authenticate_user! ,:except => [:help]
  def create
    
    if params[:profile][:"birthdate(1i)"] && params[:profile][:"birthdate(2i)"] && params[:profile][:"birthdate(3i)"]
       year = params[:profile][:"birthdate(1i)"].to_i
       month = params[:profile][:"birthdate(2i)"].to_i
       day = params[:profile][:"birthdate(3i)"].to_i
       @date = "#{day}-#{month}-#{year}"
     end
    @user=User.find(current_user.id)
    @pro=Profile.new(:name=>params[:profile][:name],
    :birthdate=>@date,
    :location=>params[:profile][:location],
    :bio=>params[:profile][:bio],
    :occupation=>params[:profile][:occupation],:gender=>params[:profile][:gender],:image=>params[:profile][:image])
    
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
   if current_user.getting_started == false
     redirect_to root_path
   end
    
    @profile = current_user.profile
  end
 

  def getting_started_completed
  
   
  end
end
