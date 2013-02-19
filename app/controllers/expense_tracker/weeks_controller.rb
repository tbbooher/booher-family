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

end
