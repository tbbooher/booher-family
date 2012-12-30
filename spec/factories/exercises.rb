# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :exercise do
    name "Clean & Jerk (Power Clean)"
    exercise_type 2
    bw_total_weight_moved_1 "femur+pelvis+torso+neck+humerus+forearm+hand"
    bw_total_weight_moved_2 "femur+pelvis+torso+neck+humerus+forearm+hand"
    bw_distance_moved_1 "0.5*tibia/12"
    bw_distance_moved_2 "((pelvis / 12) * 2)"
    weight_distance_moved "(overhead_height-0.5*plate_diameter)/12"
    bw_work_done_per_rep "weight_moved_1*bw_dist_moved_1+weight_moved_2*bw_dist_moved_2"
  end
end
