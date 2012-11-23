class CalendarController < ApplicationController

  def index
    unless @user_id = params[:user_id]
      @user_id = User.first.id
    end
    @inspection_date = params[:month_string].nil? ? Date.today : Date.parse("1-#{@month_string}")
    @year = @inspection_date.year
    @month = @inspection_date.month - 1
  end

end
