class BoatsController < ApplicationController
	def index

	end

	def create

		@boat = current_user.boats.create(boat_params)
		if @boat
			flash[:notice] = "Your boat was created successfully"
			redirect_to post_path Post.find(@comment.post_id)
		else
			flas[:alert] = "There was a problem saving your comment."
			redirect_to new_comment_path
		end

	end

	def new

	end

	def edit

	end

	def show

	end

	private

	def comment_params
		params.require(:comment).permit(:body, current_user, :post_id)
	end
end
end