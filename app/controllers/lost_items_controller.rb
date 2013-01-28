class LostItemsController < InheritedResources::Base
  belongs_to :user
  before_filter :authenticate_user!

  def create
    create! { user_lost_items_path(@user) }
  end

  def update
    update! { user_lost_items_path(@user) }
  end

end
