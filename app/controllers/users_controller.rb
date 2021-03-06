class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/', :flash => { :success => "Welcome!"}
    else
      redirect_to '/signup', :flash => { :error => "Please Signup to Continue" }

    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
