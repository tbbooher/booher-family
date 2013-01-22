class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :height_in_inches, :weight, :admin, :name, :neck, :torso, :pelvis, :femur, :tibia, :ankle, :foot, :humerus, :forearm, :hand, :neck_weight, :torso_weight, :pelvis_weight, :femur_weight, :tibia_weight, :ankle_weight, :foot_weight, :humerus_weight, :forearm_weight, :hand_weight

  has_many :goals
  has_many :lost_items
  has_many :events
  has_many :time_slots
  has_many :workouts

end
