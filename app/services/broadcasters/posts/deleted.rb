class Broadcasters::Posts::Deleted
  attr_reader :post

  def initialize(post)
    @post = post
  end

  def call
    update_posts_count
    remove_post_from_list
  end

  private

  def update_posts_count
    Turbo::StreamsChannel.broadcast_replace_to :posts_list,
                                               target: 'posts_count',
                                               partial: 'posts/count',
                                               locals: { count: Post.count }
  end

  def remove_post_from_list
    Turbo::StreamsChannel.broadcast_remove_to :posts_list, target: @post
  end
end
