class ExpenseTrackerController < ApplicationController
  def report
    @report = ExpenseTracker.get_weekly_report(4)
  end
end