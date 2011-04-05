class UserMailer < ActionMailer::Base
  def friend_request(mail)

    subject	'New friend request at Devolve'
  from	'Devolve <devolve.india@gmail.com>' 
  recipients mail[:friend].email 
  body	mail
  end
end
