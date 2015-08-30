class User < ActiveRecord::Base
  #belongs_to :administrator
  
  has_and_belongs_to_many :conferences_admined, :join_table => "administrators", :class_name =>"Master"
  has_and_belongs_to_many :conferences_authored, :join_table => "authors", :class_name => "Master"  
end
