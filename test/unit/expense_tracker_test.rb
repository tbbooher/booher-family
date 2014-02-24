require 'test_helper'

class ExpenseTrackerTest < ActiveSupport::TestCase
  def test_bank_account
    st = "1/1/2014".to_date
    ed = "2/1/2014".to_date
    transactions = ExpenseTracker.get_expenses_from_daily_spending(st, ed)
    assert_equal transactions.length, 12
  end

  def test_weekly_report
    report = ExpenseTracker.get_weekly_report(4)
    puts report
  end

  def test_expenses_for_week
    dt = "14-Feb-2014"
    transactions = ExpenseTracker.get_expenses_for_week(dt)
    assert_equal transactions.length, 10
    assert_equal transactions.first[:id], '201402130000003'
  end

  def test_populate_week
    ExpenseTracker::Week.populate_week("02-Feb-2014")
  end
end