require 'rails_helper'

RSpec.describe SectionsController, :type => :controller do

  describe "GET #index" do
  	it "renders the :index template"
  end

  describe "GET #new" do
  	it "renders the :new template"
  	it "assigns a new section to @section"
  	it "assigns a the section a course_id"
  end

  describe "GET #show" do
  	it "renders the :show template"
  	it "assigns requested section to @section"
  end

  describe "GET #edit" do
  	it "renders tehe :edit template"
  	it "assigns the requested section to @section"
  end

  describe "POST #create" do
  	context "with valid attributes" do
  		it "adds a new section to the database"
  		it "redirects to sections#show"
  	end

  	context "with invalid attributes" do
  		it "does not add a new section to the database"
  		it "redirects to :new template"
  	end
  end

  describe "PATCH #update" do
  	context "with valid attributes" do
  		it "locates the requested section"
  		it "updates the section in the database"
  		it "redirects to updated :show template"
  	end
  	context "with invalid attributes" do
  		it "does not update the section in the database"
  		it "renders the edit template"
  	end
  end

  describe "DELETE #destroy" do
  	it "deletes the course from the database"
  	it "redirects to course#show template"

  end

end
