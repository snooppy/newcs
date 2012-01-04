class Message < ActiveRecord::Base
  belongs_to :user  
  validates :text, :presence => true, :length => { :minimum => 1 }
end
