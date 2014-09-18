require 'rails_helper'

RSpec.describe CoursesController, :type => :controller do

describe "GET new course page" do 
	it "renders the new template" do 
		get :new
		expect(response).to render_template("new")
	end

	it "assigns a new course to @course" do
		course = Course.new { name = "name"}
		
	end
end
	

end
