class CoursesController < ApplicationController
	
	def index
		@course = Course.all
	end	

	def new
		@course = Course.new
	end

	def create
		@course = Course.new(course_params)

		if @course.save 
			flash[:success]="New course added!"
			redirect_to @course
		else
			flash[:error] = "There was an error creating the course."
			render action: :new
		end
	end

	def show
	@course = Course.find(params[:id])
	end


	private

	def course_params
		params.require(:course).permit(:name)
	end
end
