class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = current_user.books
  end

  def edit
   @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Success!"
      redirect_to user_path(@user.id)
    else
      flash.now[:danger] = "not success"
      render 'books/edit'
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
