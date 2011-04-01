class ProfilesController < ApplicationController
  
  def show
    @user=User.find(params[:id])
     
  end
  def edit
    @profile=current_user.profile
  end

end
