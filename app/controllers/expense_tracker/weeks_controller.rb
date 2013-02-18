class ExpenseTracker::WeeksController < InheritedResources::Base

  def show
    @week = ExpenseTracker::Week.find(params[:id])
    @reference_date = @week.start_date
    @expense_report = ExpenseTracker::DailyExpense.weekly_expenses(@reference_date)
    respond_to do |format|
      format.html
      format.json { render json: ExpenseTracker::DailyExpense.full_week(@reference_date)}
    end
  end

end
