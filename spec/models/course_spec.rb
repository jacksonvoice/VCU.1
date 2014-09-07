require 'rails_helper'

RSpec.describe Course, :type => :model do
  
  let(:valid_course) {
  	{ name: "technique" }
  }

	context "Valid Course" do
		let(:course) { Course.new(valid_course) }

		before do 
			Course.create(valid_course)
		end	


		it "should create a valid course" do
			Course.create!{@valid_course}
		end

		it "should have a valid course name" do
			expect(course.name).to eq("technique")
		end
	
	end

	context "relationships" do
		it { should have_many(:videos).through(:sections) }	
		it { should have_many(:sections) }
	end

	

end
