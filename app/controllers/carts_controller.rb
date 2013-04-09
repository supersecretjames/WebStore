class CartsController < ApplicationController
  before_filter :require_login

  def show
    @product_ids = cookies[:cart].split
  end

  def update
  end

  def checkout
    @product_ids = cookies[:cart].split
    @current_user
  end

  def destroy
    cookies[:cart] = ''
  end

  private

  def require_login
    unless signed_in?
      flash[:error] = "You must log in before interacting with your cart."
      redirect_to new_sessions_url
    end
  end
end
