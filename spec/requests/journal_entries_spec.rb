require 'spec_helper'

describe "JournalEntries" do
  describe "add new journal entry", type: :feature, js: true do
    before {
      # create user
      User.create(email: 'tim@theboohers.org', password: 'j3sterr', password_confirmation: 'j3sterr')
      # login
      get '/users/sign_in'
      fill_in "Email", with: 'tim@theboohers.org'
      fill_in "Password", with: 'j3sterr'
    }
    it "" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get journal_entries_path
      response.status.should be(200)
    end
  end
end
