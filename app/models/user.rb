class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :height_in_inches, :weight, :admin, :name, :neck, :torso, :pelvis, :femur, :tibia, :ankle, :foot, :humerus, :forearm, :hand, :neck_weight, :torso_weight, :pelvis_weight, :femur_weight, :tibia_weight, :ankle_weight, :foot_weight, :humerus_weight, :forearm_weight, :hand_weight, :description

  has_many :goals
  has_many :lost_items
  has_many :events
  has_many :workouts
  has_many :sonship_classes
  has_many :posts

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    # Uncomment the section below if you want users to be created if they don't exist
    # unless user
    #     user = User.create(name: data["name"],
    #        email: data["email"],
    #        password: Devise.friendly_token[0,20]
    #     )
    # end
    user
  end

end
