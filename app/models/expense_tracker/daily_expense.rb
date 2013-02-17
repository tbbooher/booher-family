class ExpenseTracker::DailyExpense < ActiveRecord::Base
  belongs_to :vendor, class_name: "ExpenseTracker::Vendor"
  belongs_to :category, class_name: "ExpenseTracker::Category"
  attr_accessible :amount, :date, :vendor_id, :category_id, :amount_cents, :amount_currency

  monetize :amount_cents

end
