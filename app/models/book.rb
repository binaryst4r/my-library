class Book < ActiveRecord::Base
  attr_accessible :author, :title, :user_id, :rating

  belongs_to :user


  
end
