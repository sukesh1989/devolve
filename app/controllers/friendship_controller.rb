class FriendshipController < ApplicationController
   before_filter :authenticate_user!,:setup_friends
   
   
 def index
   @friends=current_user.friends.where("name like ?","%#{params[:q]}%")
  ActiveRecord::Base.include_root_in_json = false
   respond_to do |format|
     format.html
   format.json {render :json => @friends.map,:only=>[:name,:id]}
 
 end
 end
   def create
   Friendship.request(@user, @friend)
   
   
   UserMailer.deliver_friend_request(
   :user => @user, :friend => @friend,
    :user_url => url_for(:controller => "profiles",:action => "show",:id =>@user.id),
     :accept_url => url_for(:action => "accept", 
     :id => @user.id), 
     :decline_url => url_for(:action => "decline", :id => @user.id)
   )
   
   flash[:notice] = "Friend request sent." 
   redirect_to  profile_path(@friend.id)
   end
   
   
   def accept
   if @user.requested_friends.include?(@friend)
      Friendship.accept(@user, @friend) 
     flash[:notice] = "Friendship with #{@friend.profile.name} accepted!"
   else 
     flash[:notice] = "No friendship request from #{@friend.profile.name}."
   end
   redirect_to profile_path(@friend.id)
   end
   
   def decline 
     if @user.requested_friends.include?(@friend)
       Friendship.breakup(@user, @friend)
       flash[:notice] = "Friendship with #{@friend.profile.name} declined"
    else
   flash[:notice] = "No friendship request from #{@friend.profile.name}." 
   end
   redirect_to profile_path(@friend.id)
    end
    
   def cancel 
     if @user.pending_friends.include?(@friend)
   Friendship.breakup(@user, @friend)
   flash[:notice] = "Friendship request canceled." 
   
   else
   flash[:notice] = "No request for friendship with #{@friend.profile.name}"
    end
   redirect_to profile_path(@friend.id)
    end
    
   def delete 
     if @user.friends.include?(@friend)
   Friendship.breakup(@user, @friend)
   flash[:notice] = "Friendship with #{@friend.profile.name} deleted!"
    else
   flash[:notice] = "You aren't friends with #{@friend.profile.name}"
    end
    redirect_to profile_path(@friend.id)
    end
    private
    def setup_friends
       @user = User.find(current_user.id)
        @friend = User.find_by_id(params[:id])
    end 
end
