require 'rails_helper'

RSpec.describe "courses/index", :type => :view do

	before(:each) do
		assign(:courses, [
			Course.create!(:name => "Course1"),
			Course.create!(:name => "Course2")
			])
	end

	it "shows the list of courses" do
	render
	expect(rendered).to match /Course1/
	expect(rendered).to match /Course2/

	end
end