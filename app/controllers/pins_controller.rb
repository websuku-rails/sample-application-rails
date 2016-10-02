class PinsController < ApplicationController
	before_action :set_pin, only:[:show, :edit, :update, :destroy, :correct_user]
	before_action :authenticate_user!
	before_action :correct_user, only:[:edit, :update, :destroy]

	def new 
		@pin = Pin.new(@pin)
	end

	def create
		@pin = Pin.new(post_params)
		@pin.user_id = current_user.id
		if @pin.save
			redirect_to @pin, notice: "投稿しました"
		else
			render :new
		end
	end

	def index
		@pins = Pin.all
	end

	def show
	end

	def edit
	end

	def update
		if @pin.update
			redirect_to @pin, notice: "編集しました"
		else
			render :edit
		end
	end

	def destroy
		@pin.destroy
		redirect_to pins_path
	end

	private
	def post_params
		params.require(:pin).permit(:title, :body)
	end

	def set_pin
		@pin = Pin.find(params[:id])
	end

	def correct_user 
		if current_user.id != @pin.user_id
			redirect_to root_path
		end
	end
end
