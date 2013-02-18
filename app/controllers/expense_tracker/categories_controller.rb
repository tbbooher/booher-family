class ExpenseTracker::CategoriesController < InheritedResources::Base
  before_filter :authenticate_user!

  def update
    update!{ expense_tracker_categories_path }
  end

  def create
    create! { expense_tracker_categories_path }
  end
end
