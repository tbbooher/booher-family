class Expense < ActiveRecord::Base
  attr_accessible :amount, :category, :date
end
