class ExpenseTracker::DailyExpensesController < InheritedResources::Base
  before_filter :authenticate_user!

  def update
    update!{ expense_tracker_daily_expenses_path }
  end

  def create
    create!{ expense_tracker_daily_expenses_path }
  end

end
