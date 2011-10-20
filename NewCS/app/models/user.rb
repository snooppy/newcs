
class User < ActiveRecord::Base
  
  name_regexp = /\A[\p{Cyrillic}|A-Z]\w+/u
  #name_regexp = /\A[\w|\-.|\d|]+@\w+\.\w+\z/i
  email_regexp = /\A\w+/
  
  #validates :first_name , :presence => true,:format   => { :with => name_regexp }                        
  #validates :second_name , :presence => true,:format   => { :with => name_regexp }
  #validates :last_name, :presence => true,:format   => { :with => name_regexp }
  #validates :login, :presence => true,:length   => { :minimum => 4 }
 # validates :password, :presence => true, :length   => { :minimum => 6 }
  #validates :role, :presence => true
  #validates :email, :presence => true,:format   => { :with => email_regexp }
  #validates :sex, :presence => true
end
