class Blog::CommentsController < InheritedResources::Base
  before_filter :get_post

  def get_post
    @post = Post.find(params[:post_id])
  end

  def index
    @comments = @post.comments.all # or sorted by date, or paginated, etc.
  end
end
