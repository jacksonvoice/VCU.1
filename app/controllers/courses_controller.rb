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


	def edit
		@course = Course.find(params[:id])
	end


	def show
		@course = Course.find(params[:id])
	end

	def update
		@course = Course.find(params[:id])
		if @course.update(course_params)
			redirect_to @course
		else
			render action: :edit
		end
	end


	def destroy
		@course = Course.find_by(params[:id]).destroy
		respond_to do |format|
     	 format.html { redirect_to courses_path, notice: 'Todo list was successfully destroyed.' }
    	end
	end



	private

		def course_params
			params.require(:course).permit(:name)
		end
end
