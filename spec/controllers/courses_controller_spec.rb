require 'rails_helper'

RSpec.describe CoursesController, :type => :controller do


	describe "GET #index" do 
		it "renders the :index template" do
			get :index
			expect(response). to render_template :index
		end
	end

	describe "GET #new" do
		it "renders the new template" do 
			get :new
			expect(response).to render_template("new")
		end
		it "assigns a new course to @course" do
			get :new
			expect(assigns(:course)).to be_a_new(Course)
		end

	end

	describe "GET #show" do
		it "assigns the requested course to @course" do
			course = create(:course)
			get :show, id: course
			expect(assigns(:course)).to eq course
		end
		it "renders the show template" do
			course = create(:course)
			get :show, id: course
			expect(response).to render_template :show
		end
	end

	describe "GET #edit" do
		it "renders the :edit template" do
			course = create(:course)
			get :edit, id: course
			expect(response). to render_template :edit
		end
		it "assigns the requested course to @course" do 
			course = create(:course)
			get :edit, id: course
			expect(assigns(:course)).to eq course
		end
	end  



	describe "POST #create" do
		
		context "with valid attributes" do
			it "saves the new course  in the database" do
				expect{ post :create, course: attributes_for(:course) }.to change(Course, :count).by(1)
			end
			it "redirects to courses#show" do
				post :create, course: attributes_for(:course)
				expect(response).to redirect_to course_path(assigns[:course])
			end
		end
		context "with invalid attributes" do
			it "does not save the new course in the database" do
				expect{ post :create, course: attributes_for(:invalid_course) }.to_not change(Course, :count)
			end
			it "re-renders the :new template" do
				post :create, course: attributes_for(:invalid_course)
				expect(response).to render_template :new
			end
		end
	end 




	describe "PATCH #update" do
		before :each do 
			@course = create(:course, name: 'musicality')
		end
		context "with valid attributes" do
			it "locates the requested @contact" do
				patch :update, id: @course, course: attributes_for(:course)
				expect(assigns(:course)).to eq(@course)
			end
			it "changes @course's attributes" do
				patch :update, id: @course, course: attributes_for(:course, name: 'marketing')
				@course.reload
				expect(@course.name).to eq('marketing')
			end

			it "redirects to the updated course" do
				patch :update, id: @course, course: attributes_for(:course)
				expect(response).to redirect_to @course
			end
		end

		context "with invalid attributes" do
			it "does not update the contact" do 
				patch :update, id: @course, course: attributes_for(:course, name: '')
				@course.reload
				expect(@course.name).to eq('musicality')
			end

			it "re-renders the #edit template" do
				patch :update, id: @course, course: attributes_for(:invalid_course)
				expect(response).to render_template :edit
			end

		end 
	end 

	describe "DELETE #destroy" do
		before :each do
			@course = create(:course)
		end
		it "deletes the contact from the database" do
			expect{ delete :destroy, id: @course }.to change(Course, :count).by(-1)
		end
		it "redirects to course#index" do
			delete :destroy, id: @course
			expect(response).to redirect_to courses_path
		end
	end
end	



