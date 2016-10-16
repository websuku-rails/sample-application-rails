class CommentsController < ApplicationController
	before_action :set_comment, only:[:show, :edit, :update, :destroy, :correct_user]
	before_action :authenticate_user!
	before_action :correct_user, only:[:edit, :update, :destroy]

	def new
		@comment = Comment.new(@comment)
	end

	def create
		@comment = Comment.new(post_params)
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to @comment, notice: "投稿しました"
		else
			render :new
		end
	end

	def index
		@comments = Comment.all
	end

	def show
	end

	def edit
	end

	def update
		if @comment.update
			redirect_to @comment, notice: "編集しました"
		else
			render :edit
		end
	end

	def destroy
		@comment.destroy
		redirect_to comments_path
	end

	private
	def post_params
		params.require(:comment).permit(:body)
	end

	def set_comment
		@comment = Comment.find(params[:id])
	end

	def correct_user
		if current_user.id != @comment.user_id
			redirect_to root_path
		end
	end
end
