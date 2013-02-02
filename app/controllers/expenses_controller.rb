class ExpensesController < InheritedResources::Base
  before_filter :authenticate_user!

  def update
    update!{ expenses_path }
  end

  def create
    create! { expenses_path }
  end

  def settlement
    @expenses = Expense.unpaid
    @owed = Expense.calculate_owed
  end

  def settle_up
    s = params[:settlement]
    Expense.unpaid.each do |e|
      e.paid = true
      e.save!
    end
    flash[:notice] = "All settled up"
    redirect_to "/expenses/settlement"
  end

end
