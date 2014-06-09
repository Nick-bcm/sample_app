class ProductsController < ApplicationController
  def create
    @product = Product.create(product_params)
    redirect_to action: :index
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def update
  end

  def destroy
    Product.find(params[:id]).delete
    redirect_to action: :index
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  private
    def product_params
      params.require(:product).permit(:title, :weight, :price)
    end
end
