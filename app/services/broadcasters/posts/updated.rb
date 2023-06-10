class Broadcasters::Posts::Updated
  attr_reader :post

  def initialize(post)
    @post = post
  end

  def call
    update_post_in_list
  end

  private

  def update_post_in_list
    Turbo::StreamsChannel.broadcast_replace_to :posts_list,
                                               target: @post,
                                               partial: 'posts/post',
                                               locals: { post: @post }
  end
end
