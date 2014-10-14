class SectionsController < ApplicationController

	def new
		@section = Section.new

	end	

	def create
		@section = Section.new(section_params)

		if @section.save 
			flash[:success]="New section added!"
			redirect_to @section
		else
			flash[:error] = "There was an error creating the section."
			render action: :new
		end
	end

	def show 
		@section = Section.where(course_id: params[:id])
		
	end

	private

	def section_params
		params.require(:section).permit(:name, :course_id)
	end

end
