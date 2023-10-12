class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :favorite]
  
  def index
    @products = Product.display_list(category_params, params[:page])
    @category = Category.request_category(category_params)
    @categories = Category.all
    @major_category_names = Category.major_categories
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
    @review = @reviews.new
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    @product.save!
    redirect_to product_path(@product)
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_url @product
  end

  def destroy
    @product = Product.find(param[:id])
    @product.destroy
    redirect_to products_url
  end
  
  def favorite
    current_user.toggle_like!(@product)
    redirect_to product_url @product
  end
  private
  
    def set_product
      @product = Product.find(params[:id])
    end
    
    def product_params
      params.require(:product).permit(:name, :discription, :price, :category_id)
    end
    
    def category_params
      params[:category].present? ? params[:category]
                                 : "none"
    end
end
