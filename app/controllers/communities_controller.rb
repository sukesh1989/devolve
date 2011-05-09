class CommunitiesController < ApplicationController
  
  def save
     @commu = current_user.commus.build(params[:commu])
       if @commu.save
         
         @member = current_user.memberships.build(:commu_id=>@commu.id)
         @member.save
      flash[:success] = "Community created!"
      redirect_to root_path
      else
          flash[:error] = "Error in creation of new community!(max length of community name is 20 chars)"
          redirect_to root_path
      end
  end

  def index
  end

  def show
    @community=Commu.find(params[:id])
    
    @posts = @community.posts.paginate(:per_page => 10,:page => params[:page])
  end
  
  
  def create
    
  end
  def join
    
      
      @member = current_user.memberships.build(:commu_id=>params[:id])
       if @member.save
      flash[:success] = "Sucessfully joined the Community!"
      redirect_to  communities_show_path+'/'+params[:id]
      else
          flash[:error] = "Error in joining"
          redirect_to root_path
      end
  end
  def delete
    @member=Membership.find_by_user_id_and_commu_id(current_user.id,params[:id])
    @member.destroy
    
    flash[:success] = "You've unjoined from this Community!"
    redirect_to  communities_show_path+'/'+params[:id]
  end
def destroy
  
    @com=Commu.find_by_id_and_user_id(params[:id],current_user.id)
    @com.destroy
    
    flash[:success] = "You've succesfully removed the Community!"
    redirect_to root_url
end
def create_post
  @commu=Commu.find(params[:id])
  @post=@commu.posts.build(:title=>params[:post][:title],:body=>params[:post][:body])
  
  
   if @post.save
     @post1=Post.find(@post.id)
     @comment=@post1.comments.build(:title=>params[:post][:title],:body=>params[:post][:body])
     @comment.save
  flash[:success] = "Post Saved!"
  redirect_to  communities_show_path+'/'+params[:id]
  else
      flash[:error] = "Error in creation of the post"
      redirect_to communities_show_path+'/'+params[:id]
  end
  
end

def post
  @post=Post.find(params[:id])
  
  @comments = @post.comments.paginate(:per_page => 10,:page => params[:page])
end

def create_comment
  @commu=Post.find(params[:id])
  @post=@commu.comments.build(:title=>params[:post][:title],:body=>params[:post][:body])
 
  
   if @post.save
  flash[:success] = "Comment Saved!"   
     redirect_to  communities_post_path+'/'+params[:id]
  else
      flash[:error] = "Error in your comment"
      redirect_to  communities_post_path+'/'+params[:id]
  end
  
end

end
