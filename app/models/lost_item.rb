class LostItem < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date_lost, :description, :name, :priority, :user_id
end
