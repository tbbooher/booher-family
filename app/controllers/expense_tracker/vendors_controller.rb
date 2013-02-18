class ExpenseTracker::VendorsController < InheritedResources::Base
  before_filter :authenticate_user!

  def update
    update!{ expense_tracker_vendors_path }
  end

  def create
    create! { expense_tracker_vendors_path }
  end

end
