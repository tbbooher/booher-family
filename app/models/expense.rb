class Expense < ActiveRecord::Base
  attr_accessible :amount, :category, :date, :payer, :category, :description

  CATEGORIES = {1 => :kids, 2 => :car, 3 => :other, 4 => :household}

  PAYERS = {1 => :au_pair, 2 => :host_family}

  def type_name
    CATEGORIES[self.type].to_s
  end

  def payer_name
    PAYERS[self.payer].to_s
  end

end
