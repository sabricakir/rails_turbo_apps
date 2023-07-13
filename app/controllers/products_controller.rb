class ProductsController < ApplicationController
  layout "products_layout"
  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by!(id: params[:id])
    Current.user&.recently_viewed_products << @product.id
  end
end
