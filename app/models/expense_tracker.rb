module ExpenseTracker
  def self.table_name_prefix
    'expense_tracker_'
  end

  class << self

    def get_usaa_creds
      #File.open(Rails.root.join('usaa_creds')) do |file|
        @user_name, @password, @account = USAA_CREDENTIALS['USAA_NUM'],  USAA_CREDENTIALS['USAA_PIN'],  USAA_CREDENTIALS['USAA_ACCOUNT']
      #end
    end

    def get_expenses_for_week(d)
      dt = d.to_date
      st = dt.beginning_of_week(start_day = :thursday)
      ed = dt.end_of_week(start_day = :thursday)
      puts "#{st} | #{ed}"
      get_expenses_from_daily_spending(st, ed)
    end

    def summarize_week(st)
      expenses = get_expenses_for_week(st)
      total = 0.0
      expenses.each do |e|
        total = total + e[:amount] unless e[:amount] > 0
      end
      {expenses: expenses, total: total, start: st}
    end

    def get_weekly_report(week_num)
      st = week_num.weeks.ago.beginning_of_week(start_day = :thursday)
      i = 0
      summaries = []
      while st < Date.today
        summaries[i] = summarize_week(st)
        i = i + 1
        st = st.next_week(:thursday)
      end
      summaries
    end

    def get_expenses_from_daily_spending(st, ed)
      # this requires st and ed to be actual dates
      # this should return transactions
      get_usaa_creds
      fi = OFX::FinancialInstitution.get_institution('USAA')
      fi.set_client(@user_name, @password)
      bsm = fi.send(fi.create_request_document_for_bank_statement(@account,(st..ed)))
      transactions = bsm.message_sets[1].responses[0].transactions
      return transactions.map{|t| {id: t.financial_institution_transaction_identifier, date_posted: t.date_posted, amount: t.amount, payee: t.payee} }
    end
  end

end
