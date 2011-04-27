class ProfilesController < ApplicationController
  helper :friendship
  before_filter :authenticate_user!
  
  def show
    @user_current=User.find(params[:id])
    @microposts = @user_current.microposts.paginate(:per_page => 5,:page => params[:page]) 
    
  end
  def edit
    @profile=current_user.profile
  end
  def create
    
        @image=current_user.profile.image
    if params[:profile][:image]
    
        @image=params[:profile][:image]
    end
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
    :occupation=>params[:profile][:occupation],:gender=>params[:profile][:gender],:image=>@image)
 
    @user.profile=@pro
        redirect_to root_path
  end
end
