class JoinsController < ApplicationController
	before_action :set_post, only:[:show, :edit, :update, :destroy, :correct_user]
	before_action :authenticate_user!
	before_action :correct_user, only:[:edit, :update, :destroy]

	def new 
		@join = Join.new(@join)
	end

	def create
		@join = Join.new(post_params)
		@join.user_id = current_user.id
		if @join.save
			redirect_to @join, notice: "投稿しました"
		else
			render :new
		end
	end

	def index
		@joins = Join.all
	end

	def show
	end

	def edit
	end

	def update
		if @join.update
			redirect_to @join, notice: "編集しました"
		else
			render :edit
		end
	end

	def destroy
		@join.destroy
		redirect_to joins_path
	end

	private
	def post_params
		params.require(:join).permit(:title, :body)
	end

	def set_comment
		@join = Join.find(params[:id])
	end

	def correct_user 
		if current_user.id != @join.user_id
			redirect_to root_path
		end
	end
end
