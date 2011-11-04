class Message < ActiveRecord::Base
  validates :text, :presence => true, :length => { :minimum => 2 }
end
