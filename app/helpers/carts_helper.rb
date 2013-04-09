module CartsHelper

  def cart
    cookies[:cart] ||= []
  end

end
