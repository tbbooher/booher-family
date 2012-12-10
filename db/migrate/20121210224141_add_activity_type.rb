class AddActivityType < ActiveRecord::Migration
  def change
    remove_column :activities, :type
    add_column :activities, :activity_type, :integer
  end
end
