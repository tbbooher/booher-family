require 'spec_helper'

describe Exercise do
  # for inspiration, see https://github.com/intridea/profanity_filter/blob/master/lib/profanity_filter.rb
  # http://www.criticalbench.com/wp-content/uploads/2012/02/garhammer-olympic-lifting-vs-powerlifting.pdf
  it "should only allow approved words" do
    Exercise.clean("femur+pelvis+torso+neck+humerus+forearm+hand").should eql("femur+pelvis+torso+neck+humerus+forearm+hand")
    Exercise.clean("femur+delete_all+torso+neck+humerus+destroy\n code").should eql("femur+torso+neck+humerus")
    Exercise.clean("Exercise.destroy_all").should eql("")
  end

  it "should not save if there are unapproved words" do

  end
end
