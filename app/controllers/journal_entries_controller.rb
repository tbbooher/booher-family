class JournalEntriesController < InheritedResources::Base

  before_filter :only_tim

  def new
    @journal_entry = JournalEntry.new
    @last_entry = JournalEntry.last
    @journal_entry.to_do = @last_entry.to_do if @last_entry
    new!
  end

  def index
    @journal_entries = JournalEntry.order("entry_date desc").page(params[:page])
    index!
  end

  def create
    create! { journal_entries_path }
  end

  def update
    update! { journal_entries_path }
  end

  def only_tim
    unless current_user && current_user.id == 1
      redirect_to root_url, :alert => "Access denied."
    end
  end

end
