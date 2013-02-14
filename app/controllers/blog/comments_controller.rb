class Blog::CommentsController < InheritedResources::Base

  def add_comment
    @post = Post.find(params[:id])
    @user_who_commented = @current_user
    @comment = Comment.build_from( @article, @user_who_commented.id, "Hey guys this is my comment!" )
  end
end
