class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user
      sign_in(user)
      flash[:success] = "logged in"
      redirect_to user_url(user)
    else
      flash[:failure] = "log in failed"
      render :new
    end
  end

  def destroy
    sign_out
    empty_cart
    redirect_to users_url
  end

end
