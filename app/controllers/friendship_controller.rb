class FriendshipController < ApplicationController
   before_filter :authenticate_user!,:setup_friends
   def create
   Friendship.request(@user, @friend)
   
   
   UserMailer.deliver_friend_request(
   :user => @user, :friend => @friend,
    :user_url => profiles_url(@user.id),
     :accept_url => url_for(:action => "accept", 
     :id => @user.id), 
     :decline_url => url_for(:action => "decline", :id => @user.id)
   )
   
   flash[:notice] = "Friend request sent." 
   redirect_to  profiles_path(@friend.id)
   end
   private
   def setup_friends
      @user = User.find(current_user.id)
     @friend = User.find(params[:id])
   end 
end
