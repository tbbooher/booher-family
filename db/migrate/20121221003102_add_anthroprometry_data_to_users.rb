class AddAnthroprometryDataToUsers < ActiveRecord::Migration
  def change
    # all in lbs
    add_column :users, :neck_weight, :decimal
    add_column :users, :torso_weight, :decimal
    add_column :users, :pelvis_weight, :decimal
    add_column :users, :femur_weight, :decimal
    add_column :users, :tibia_weight, :decimal
    add_column :users, :ankle_weight, :decimal
    add_column :users, :foot_weight, :decimal
    add_column :users, :humerus_weight, :decimal
    add_column :users, :forearm_weight, :decimal
    add_column :users, :hand_weight, :decimal

    add_column :users, :neck, :decimal
    add_column :users, :torso, :decimal
    add_column :users, :pelvis, :decimal
    add_column :users, :femur, :decimal
    add_column :users, :tibia, :decimal
    add_column :users, :ankle, :decimal
    add_column :users, :foot, :decimal
    add_column :users, :humerus, :decimal
    add_column :users, :forearm, :decimal
    add_column :users, :hand  , :decimal
  end
end
