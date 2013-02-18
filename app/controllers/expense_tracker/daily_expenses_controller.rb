class ExpenseTracker::DailyExpensesController < InheritedResources::Base
  before_filter :authenticate_user!
  belongs_to :week, :class_name => 'ExpenseTracker::Week'

  #def index
  #  @daily_expenses = ExpenseTracker::DailyExpense.order_by{|d| d.date}
  #  index!
  #end

  def update
    update!{ expense_tracker_week_daily_expenses_path(@week) }
  end

  def create
    create!{ expense_tracker_week_daily_expenses_path(@week) }
  end

end
