class Post < ApplicationRecord
  has_and_belongs_to_many :tags
  has_many :post_prices, dependent: :destroy
  belongs_to :user
  belongs_to :product

  accepts_nested_attributes_for :post_prices

  def dependent_post_prices
    product&.product_prices
  end
  # broadcasts_to ->(_post) { :posts_list }

  # after_commit { broadcast_append_to :posts_list, on: :create }
  # after_update_commit { broadcast_replace_to :posts_list }
  # after_destroy_commit { broadcast_remove_to :posts_list }

  # after_create_commit do
  #   update_posts_count
  #   broadcast_append_to :posts_list, target: 'posts', partial: 'posts/post', locals: { post: self }
  # end

  # after_update_commit do
  #   broadcast_replace_to :posts_list, target: self, partial: 'posts/post', locals: { post: self }
  # end

  # after_destroy_commit do
  #   update_posts_count
  #   broadcast_remove_to :posts_list, target: self
  # end

  # private

  # def update_posts_count
  #   broadcast_replace_to :posts_list, target: 'posts_count', partial: 'posts/count', locals: { count: Post.count }
  # end
end
