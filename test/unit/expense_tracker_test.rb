require 'test_helper'

class ExpenseTrackerTest < ActiveSupport::TestCase
  def test_bank_account
    st = "1/1/2014".to_date
    ed = "2/1/2014".to_date
    transactions = ExpenseTracker.get_expenses_from_daily_spending(st, ed)
    assert_equal transactions.length, 12
  end

  def test_weekly_report
    VCR.use_cassette('weekly_pull') do
      report = ExpenseTracker.get_weekly_report(4)
      assert_equal report.size, 4
    end
  end

  def test_weekly_report_getting_the_right_dates
    Timecop.travel(Time.local(2014, 3, 1, 10, 0, 0))
    wks = ExpenseTracker.get_weeks(4)
    assert_equal wks.size, 4
    assert_equal wks[0][:start].to_s, "2014-01-30 00:00:00 UTC"
    assert_equal wks[0][:end].to_s, "2014-02-05 23:59:59 UTC"
  end

  #def test_that_each_report_is_accurate
  #  Timecop.travel(Time.local(2014, 3, 1, 10, 0, 0))
  #  ExpenseTracker.get_weeks(10).each do |wk|
  #
  #  end
  #end

  def test_the_ability_to_get_exact_transations_for_a_week
    VCR.use_cassette('expense_test_pull') do
      st = DateTime.parse("2014-01-30 00:00:00 UTC")
      ed = DateTime.parse("2014-02-05 23:59:59 UTC")
      expenses = ExpenseTracker.get_expenses_from_daily_spending(st, ed)
      expenses.each do |e|
        puts "#{e[:date_posted]} before" unless e[:date_posted] > st
        puts "#{e[:date_posted]} is after" unless e[:date_posted] < ed
        assert e[:date_posted].to_i.between?(st.to_i,ed.to_i), "#{e[:date_posted].to_s(:db)} not in range"
      end
    end
  end

  def test_expenses_for_week
    dt = "14-Feb-2014"
    transactions = ExpenseTracker.get_expenses_for_week(dt)
    assert_equal transactions.length, 10
    assert_equal transactions.first[:id], '201402130000003'
  end

end