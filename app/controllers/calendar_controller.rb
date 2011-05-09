class CalendarController < ApplicationController
   
   before_filter :authenticate_user!
     layout 'events'
  def index
    
   end
end
