require 'rails_helper'

RSpec.describe Course, :type => :model do

	it "should create a valid course with a valid name" do
		course = Course.new(name: 'name1')
		expect(course).to be_valid
	end

	it "should be invalid with no name" do
		course = Course.new(name: '')
		expect(course).to be_invalid
	end

	it { should have_many(:videos).through(:sections) }
	it { should have_many(:sections) }

	it "should be invalid with a duplicate name" do 
		Course.create(name: 'name1')
		course = Course.new(name: 'name1')
		expect(course).to have(1).errors_on(:name)
	end

	it "has a valid factory" do
		expect(FactoryGirl.buld(:course)).to be_valid
	end


end