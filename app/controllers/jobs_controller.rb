class JobsController < ApplicationController
	def index
		@jobs = Job.all
		@users = User.all

		@job_current_user = Job.first.user.first_name
	end
	def create
		job = Job.new

		job.user_id = params[:current_user_id]
		job.origin = params[:job]['origin']
		job.destination = params[:job]['destination']
		job.cost = params[:job]['cost']
		job.containers = params[:job]['containers']

		job.save

	end
	def show
		@jobs = Job.all
		@job.user_id = User.id
		@job.destination = params[:job]['destination']
	end
end
