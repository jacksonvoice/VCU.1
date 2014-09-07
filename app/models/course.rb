class Course < ActiveRecord::Base
	has_many :videos, through: :sections
	has_many :sections

end
