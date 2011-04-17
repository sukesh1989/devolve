class Code < ActiveRecord::Base
  attr_accessible :content,:title,:langauge,:description
  belongs_to :user 
  validates :content, :presence => true, :length => { :maximum => 500 }
   validates :title, :presence => true 
   validates :langauge, :presence => true 
   
   default_scope :order => 'codes.created_at DESC' 

  
end
