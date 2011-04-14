class MicropostsController < ApplicationController
  before_filter :authenticate_user! ,:only => [:create, :destroy]
  def create 
    @micropost = current_user.microposts.build(params[:micropost])
     if @micropost.save
    flash[:success] = "Micropost created!"
    redirect_to root_path
    else
        flash[:error] = "Micropost is not created!"
        redirect_to root_path
    end
    end
  def destroy
@micropost=Micropost.find(params[:id])
    @micropost.destroy
    
     redirect_to  profile_path(current_user.id)
  end
end
