class Goal < ActiveRecord::Base
  attr_accessible :description, :due_date, :name

  belongs_to :user

end
