class Properties::GoalsController < InheritedResources::Base
  belongs_to :user
  before_filter :authenticate_user!

  def create
    create! { user_goals_path(@user) }
  end

  def update
    update! { user_goals_path(@user) }
  end
end
