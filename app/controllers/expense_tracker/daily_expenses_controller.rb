class ExpenseTracker::DailyExpensesController < InheritedResources::Base
  before_filter :authenticate_user!
  belongs_to :week

  #def index
  #  @daily_expenses = ExpenseTracker::DailyExpense.order_by{|d| d.date}
  #  index!
  #end

  def update
    update!{ expense_tracker_daily_expenses_path }
  end

  def create
    create!{ expense_tracker_daily_expenses_path }
  end

  def expense_report
    @reference_date = Date.today
    @expenses = ExpenseTracker::DailyExpense.weekly_expenses(@reference_date)
    # {date: date, day: idx, ideal: ideal, spent: spent, cumulative: cumulative, surplus: surplus, remaining: remaining}
    respond_to do |format|
      format.html
      format.json { render json: ExpenseTracker::DailyExpense.full_week(@reference_date)}
    end
  end

end
