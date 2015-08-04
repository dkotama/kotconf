class Master < ActiveRecord::Base
	has_one :site
	has_and_belongs_to_many :administrators, :join_table => "administrators", :class_name => "User"
	has_and_belongs_to_many :authors, :join_table => "authors", :class_name => "User"
end
