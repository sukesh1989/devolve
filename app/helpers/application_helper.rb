module ApplicationHelper
  
  
  def coderay(text)
    text.gsub!(/\<code(?: lang="(.+?)")?\>(.+?)\<\/code\>/m) do 
         code = CodeRay.scan($2, $1).div(:css => :class) 
         "<notextile>#{code}</notextile>" 
       end 
       return text.html_safe
  end
  
 
end
