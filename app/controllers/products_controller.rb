require 'pry'
class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def new
    @categories = Category.all
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      { status: :success }
      redirect_to products_path
    else
      redirect_to new_products_path
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:notice] = 'Product updated'
      redirect_to root_path
    else
      flash[:error] = 'Failed to edit product!'
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.delete
    redirect_to products_path
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id)
  end
end
