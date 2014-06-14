module ExpenseTracker
  def self.table_name_prefix
    'expense_tracker_'
  end

  class << self

    def get_expenses_for_week(d)
      dt = d.to_date
      st = dt.beginning_of_week(start_day = :thursday)
      ed = dt.end_of_week(start_day = :thursday)
      get_expenses_from_daily_spending(st, ed)
    end

    def summarize_week(st, ed)
      expenses = get_expenses_from_daily_spending(st, ed)
      total = 0.0
      expenses.each do |e|
        total = total + e[:amount] unless e[:amount] > 0
      end
      {expenses: expenses, total: total, start: st}
    end

    def get_weekly_report(week_num)
      get_weeks(week_num).map{ |wk| summarize_week(wk[:start], wk[:end]) }
    end

    def get_weeks(week_num)
      # find thursday based weeks
      st = week_num.weeks.ago.beginning_of_week(start_day = :thursday)
      (0..(week_num-1)).map do |w|
        s = st + w.weeks
        {start: s, end: s.end_of_week(start_day = :thursday)}
      end
    end

    def request_statement(st, ed)
      # OFX (at USAA at least) changes the range to be noon the day before the
      # first date of the request and to noon of the last day of the request, so we add 12.hours on at the end
      # it would be great to be able to request by day
      st, ed = (st.to_datetime), (ed.to_datetime + 1.day)
      fi = OFX::FinancialInstitution.get_institution('USAA')
      fi.set_client(USAA_CREDENTIALS['USAA_NUM'], USAA_CREDENTIALS['USAA_PIN'])
      bsm = fi.send(fi.create_request_document_for_bank_statement(USAA_CREDENTIALS['USAA_ACCOUNT'],(st..ed)))
      bsm.message_sets[1].responses[0]
    end

    def get_expenses_from_daily_spending(st, ed)
      attempts = 0
      trans = []
      loop do
        attempts = attempts + 1
        raise "too many attempts, api is jacked up" if attempts > 7
        # load transactions
        resp = request_statement(st, ed)
        transactions, range = resp.transactions, resp.transaction_range
        # test if valid and break if valid
        st_ = st - 1.day # because of the shift
        ed_ = ed + 1.day # because of the shift again
        unless (range.begin < st_) || (range.end > ed_) # then we are not valid
          # remove any rough edges
          transactions.delete_if{|t| !(t.date_posted.to_i.between?(st.to_i,ed.to_i))}
          trans = transactions
          break
        else
          puts "repeat"
        end
      end
      trans.map{|t| {id: t.financial_institution_transaction_identifier, date_posted: t.date_posted, amount: t.amount, payee: t.payee} }
    end

  end

end
