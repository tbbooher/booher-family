require 'spec_helper'

describe ExpenseTracker::DailyExpense do

  context "with a bunch of expenses" do
    # we will use the pay period 14 to 21 february
    before {
      [[10,9.82], [14, 1], [14, 2], [14,2], [16,1], [17,1], [22,0.98] ].each do |day, amount|
        FactoryGirl.create(:expense_tracker_daily_expense, amount: amount, date: Date.new(2013,2,day))
      end
    }
    it "should have 7 expenses" do
      ExpenseTracker::DailyExpense.all.size.should eq(7)
    end

    it "should find all the events in the relevant week" do
      # it is going to find the last thursday
      # I LOVE LAUREN !!!!!!!!!!!!
      # LAUREN IS CUTE
      # LAUREN IS SWEET
      # CAKE IS SWEET
      # !!!!!!!!!!!!!!!!!!!!!!!!!!
      in_week = ExpenseTracker::DailyExpense.in_week(Date.new(2013,2,18))
      in_week.all.size.should eq(5)
    end

    it "should build a nice list of expenses by day" do
      dt = Date.new(2013,2,18)
      ExpenseTracker::DailyExpense.weekly_expenses(dt).size.should eq(3)
    end

    it "should build a nice list of expenses by day" do
      dt = Date.new(2013,2,18)
      expenses = ExpenseTracker::DailyExpense.weekly_expenses(dt)
      expenses.sum{|e| e[:spent]}.should eq(7)
    end

  end

end
