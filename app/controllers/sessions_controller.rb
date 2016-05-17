class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # redirect_to '/'
      redirect_to '/', :flash => { :success => "Welcome!" }

    else
      redirect_to '/login', :flash => { :alert => "Please Login First" }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
