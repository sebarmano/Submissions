class UsersController < ApplicationController
  def new
    @user = User.new
    @teachers = User.where(teacher_id: 1)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to assignments_path, notice: "Thank you for signing up"
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :teacher_id)
  end
end
