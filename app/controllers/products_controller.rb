class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by!(id: params[:id])
    Current.user&.recently_viewed_products&.<< @product.id
  end
end
