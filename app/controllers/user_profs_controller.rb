class UserProfsController < ApplicationController
	before_action :set_user_prof, only:[:show, :edit, :update, :destroy, :correct_user]
	before_action :authenticate_user!
	before_action :correct_user, only:[:edit, :update, :destroy]

	def new 
		@user_prof = User_prof.new(@user_prof)
	end

	def create
		@user_prof = User_prof.new(post_params)
		@user_prof.user_id = current_user.id
		if @user_prof.save
			redirect_to @user_prof, notice: "投稿しました"
		else
			render :new
		end
	end

	def index
		@user_profs = User_prof.all
	end

	def show
	end

	def edit
	end

	def update
		if @user_prof.update
			redirect_to @user_prof, notice: "編集しました"
		else
			render :edit
		end
	end

	def destroy
		@user_prof.destroy
		redirect_to events_path
	end

	private
	def post_params
		params.require(:user_prof).permit(:name, :age, :gender, :skillLevel, :introduction)
	end

	def set_user_prof
		@user_prof = User_prof.find(params[:id])
	end

	def correct_user 
		if current_user.id != @user_prof.user_id
			redirect_to root_path
		end
	end
end
