class SearchController < ApplicationController
  
  before_filter :authenticate_user!
  def index
    @search_string=params[:search][:query]
    @search_items = Profile.find(:all, :conditions => "name LIKE '%#{@search_string}%'").paginate(:page=>params[:page],:per_page=>20)
 
  end

end
