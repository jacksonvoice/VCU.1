class Course < ActiveRecord::Base
	has_many :videos, through: :sections
	has_many :sections

	validates :name, presence: true, uniqueness: true

end
