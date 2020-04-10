class UsersController < ApplicationController

  before_action :set_user, only: %i(show edit update)
  before_action :require_login, only: %i(show edit update)
  before_action :require_to_edit_user, only: %i(edit update)

  def index
    @users = User.all
  end

  def show

  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:description, :age, :name, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_login
    unless user_signed_in?
      flash[:error] = "Musisz się zalogować by mieć dostęp do tej sekcji"
      redirect_to new_user_session_path
    end
  end

  def require_to_edit_user
    unless current_user == @user
      redirect_to root_path
    end
  end
end
