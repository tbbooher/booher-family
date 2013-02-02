class Blog::PostsController < InheritedResources::Base
  def show
    @article = Article.find(params[:id])
    @user_who_commented = @current_user
    @comment = Comment.build_from( @article, @user_who_commented.id, "Hey guys this is my comment!" )
    show!
  end

end
