class ExpenseTracker::WeeksController < InheritedResources::Base

  def show
    @week = ExpenseTracker::Week.find(params[:id])
    @reference_date = @week.start_date
    @expense_report = @week.table_array
    respond_to do |format|
      format.html
      format.json { render json: @week.chart_array}
    end
  end

  def populate_week
    @week = ExpenseTracker::Week.find(params[:week_id])
    @new_expenses = @week.populate_week
  end

  def expense_by_categories
    render json: ExpenseTracker::Week.find(params[:week_id]).daily_expenses.group_by{|e| e.category}.map{|g,i| {label: g.name, value: i.sum(&:amount).to_f}}
  end

end
