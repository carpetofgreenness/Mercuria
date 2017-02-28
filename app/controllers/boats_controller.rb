class BoatsController < ApplicationController
	def index
		@boats = Boat.all

	end

	def create

		@boat = current_user.boats.create(boat_params)
		if @boat
			flash[:notice] = "Your boat was created successfully"
			redirect_to @boat
		else
			flash[:alert] = "There was a problem saving your comment."
			redirect_to new_comment_path
		end

	end

	def new

	end

	def edit

	end

	def show
		@boat = Boat.find(params[:id])
	end

	private

	def boat_params
		params.require(:boat).permit(:name, :location, :container_num)
	end
end