class Expense < ActiveRecord::Base
  attr_accessible :amount, :category, :date, :payer, :category, :description, :paid, :amount_cents, :amount_currency

  monetize :amount_cents

  CATEGORIES = {1 => :kids, 2 => :car, 3 => :other, 4 => :household}

  PAYERS = {1 => :au_pair, 2 => :host_family}

  scope :unpaid, where(paid: false)

  def category_name
    CATEGORIES[self.category].to_s
  end

  def payer_name
    PAYERS[self.payer].to_s
  end

  def self.calculate_owed
    # -10 => tim and chrissy owe vivi 10 dollars (payer => 1)
    a = Money.new(0)
    Expense.unpaid.each do |e|
      puts "here: #{a}"
      a = a + (e.payer == 1 ? -e.amount : e.amount)
    end
    a
  end

end
