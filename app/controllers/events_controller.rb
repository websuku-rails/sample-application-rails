class EventController < ApplicationController
	before_action :set_event, only:[:show, :edit, :update, :destroy, :correct_user]
	before_action :authenticate_user!
	before_action :correct_user, only:[:edit, :update, :destroy]

	def new 
		@event = Event.new(@event)
	end

	def create
		@event = Event.new(post_params)
		@event.user_id = current_user.id
		if @event.save
			redirect_to @event, notice: "投稿しました"
		else
			render :new
		end
	end

	def index
		@events = Event.all
	end

	def show
	end

	def edit
	end

	def update
		if @event.update
			redirect_to @event, notice: "編集しました"
		else
			render :edit
		end
	end

	def destroy
		@event.destroy
		redirect_to events_path
	end

	private
	def post_params
		params.require(:event).permit(:title, :body)
	end

	def set_event
		@event = Event.find(params[:id])
	end

	def correct_user 
		if current_user.id != @event.user_id
			redirect_to root_path
		end
	end
end
