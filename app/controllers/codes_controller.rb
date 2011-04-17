class CodesController < ApplicationController
 
  before_filter :authenticate_user! ,:except => [:view]
  def index
    
         @user_current=User.find(params[:id])
         @codes = @user_current.codes.paginate(:per_page => 5,:page => params[:page])
  end

  def create
  end
  
   def save 
      
      @code = current_user.codes.build(params[:code])
       if @code.save
     render(:template=>'codes/saved')
      else
         
        render(:template=>'codes/notsaved')
      end
      end
      def view
         @user_current=User.find(params[:id1])
         @code_of=@user_current.codes.find(params[:id])
      end
      
        def destroy
      @code=Code.find(params[:id])
          @code.destroy

           redirect_to  profile_path(current_user.id)
        end

end
