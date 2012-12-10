class AddMoneyToMealsAndActivities < ActiveRecord::Migration
  def change
    remove_column :trip_meals, :budget
    remove_column :activities, :budget
    add_money :trip_meals, :budget
    add_money :activities, :budget
  end
end
