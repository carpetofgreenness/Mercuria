class JobsController < ApplicationController
	def index
		@jobs = Job.all
		@users = User.all

		@job_current_user = Job.first.user.first_name
	end
	def create
		@job = current_user.jobs.create(job_params)
			if @job.save
				flash[:notice] = "Your Job was successfully created"
				redirect_to @job
			else
				flash[:alert] = "There was a problem saving your job"
				redirect_to new_job_path
			end
	end
	def show
		@job = Job.find(params[:id])
		@job_user = @job.user 
	end
	def new
		@job = Job.new	
	end
	def edit
		@job = Job.find(params[:id])
	end

	private

	def job_params
		params.require(:job).permit(:name, :origin, :destination, :cost, :containers, :description)
	end
end
