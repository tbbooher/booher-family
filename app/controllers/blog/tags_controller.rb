class Blog::TagsController < InheritedResources::Base
  def create
    create! { blog_tags_path }
  end

  def update
    update! { blog_tags_path }
  end

end
