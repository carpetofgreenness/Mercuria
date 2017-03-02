class BoatJobsController < ApplicationController

	def index
		@boat_jobs = BoatJob.all
		@jobs = Job.all
		@boats = Boat.all
		@boat_job = BoatJob.new
	end

	def create
		@boat_job = BoatJob.create(boat_job_params)
		if @boat_job.save
			flash[:notice] = "Your boat was successfully added to this job"
			redirect_to :back
		else
			flash[:alert] = "There was a problem adding your boat to this job."
			redirect_to :back
		end
	end

	# def new

	# end

	# def edit

	# end
	# the new action is in index,and there is nothing to edit about a boatjob!

	def show

	end

	def update

	end

	def destroy
		boatjob = BoatJob.find(params[:id]).destroy
		flash[:notice] = "The boat was successfully removed form this job"
		redirect_to :back
	end

	private

	def boat_job_params
		params.require(:boat_job).permit(:boat_id, :job_id)
	end

end