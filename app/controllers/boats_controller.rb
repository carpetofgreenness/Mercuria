class BoatsController < ApplicationController
	def index
		@boats = Boat.all

	end

	def show
		@boat = Boat.find(params[:id])
		@boat_user = @boat.user
	end

	def create

		@boat = current_user.boats.create(boat_params)
		if @boat.save
			flash[:notice] = "Your boat was created successfully"
			redirect_to @boat
		else
			flash[:alert] = "There was a problem saving your boat."
			render :new
		end

	end

	def new
		@boat = Boat.new
	end

	def edit
		@boat = Boat.find(params[:id])
	end

	def update
		boat = Boat.find(params[:id])
		boat.update_attributes(boat_params)
		redirect_to boat
	end

	def destroy
	  	Boat.find(params[:id]).destroy
	  	redirect_to "/boats"
	end


	private

	def boat_params
		params.require(:boat).permit(:name, :location, :container_num, :avatar)
	end
end