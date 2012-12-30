class JournalEntriesController < InheritedResources::Base
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
end
