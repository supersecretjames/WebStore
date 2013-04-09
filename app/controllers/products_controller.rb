class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])

    if @product.save
      flash[:success] = "Product created!"
      redirect_to product_url(@product)
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:product_id])
    cookies[:cart] += " #{@product.id}"

    flash[:success] = "#{@product.name} added to cart."

    redirect_to product_url(@product)
  end


end
