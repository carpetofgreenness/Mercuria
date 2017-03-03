class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@boats = @user.boats
		@jobs = @user.jobs
		@boat_jobs = BoatJob.all
		@boat_job = BoatJob.new
		@boat_jobs = BoatJob.all
	end

	def index
		@users = User.all
		@jobs = Job.all
	end
end