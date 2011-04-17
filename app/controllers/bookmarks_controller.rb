class BookmarksController < ApplicationController


   before_filter :authenticate_user! ,:only => [:create, :destroy]
   def index
       @user_current=User.find(params[:id])
       @bookmarks = @user_current.bookmarks.paginate(:per_page => 5,:page => params[:page]) 
       
   end
   def saved
     
   end
    def save 
      
      @bookmark = current_user.bookmarks.build(params[:bookmark])
       if @bookmark.save
     render(:template=>'bookmarks/saved')
 
      else
         
        render(:template=>'bookmarks/notsaved')
      end
      end
      
      
      def create
        
      end
    def destroy
  @bookmark=Bookmark.find(params[:id])
      @bookmark.destroy

       redirect_to  profile_path(current_user.id)
    end
  end
  