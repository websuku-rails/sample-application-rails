class PlacesController < ApplicationController
	before_action :set_place, only:[:show, :edit, :update, :destroy, :correct_user]
	before_action :authenticate_user!
	before_action :correct_user, only:[:edit, :update, :destroy]

	def new 
		@place = Place.new(@place)
	end

	def create
		@place = Place.new(post_params)
		@place.user_id = current_user.id
		if @place.save
			redirect_to @place, notice: "投稿しました"
		else
			render :new
		end
	end

	def index
		@places = Place.all
	end

	def show
	end

	def edit
	end

	def update
		if @place.update
			redirect_to @place, notice: "編集しました"
		else
			render :edit
		end
	end

	def destroy
		@place.destroy
		redirect_to places_path
	end

	private
	def post_params
		params.require(:place).permit(:name, :url, :price)
	end

	def set_place
		@place = Place.find(params[:id])
	end

	def correct_user 
		if current_user.id != @place.user_id
			redirect_to root_path
		end
	end
end
