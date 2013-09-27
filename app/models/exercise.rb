class Exercise < ActiveRecord::Base
  attr_accessible :name, :exercise_type, :bw_total_weight_moved_1, :bw_total_weight_moved_2, :bw_distance_moved_1, :bw_distance_moved_2, :weight_distance_moved, :bw_work_done_per_rep

  autocomplete :brand, :name

  #has_many :workouts, through: :reps

  TYPE = {1 => :crossfit, 2 => :weight_lifting, 3 => :running}

  COMPONENTS = %w{femur pelvis torso neck weight hand forearm humerus tibia foot height plate_diameter}

  # bw_total_weight_moved_1 (lbs)
  # bw_total_weight_moved_2 (lbs)
  # bw_distance_moved_1 (ft)
  # bw_distance_moved_2 (ft)
  # weight_distance_moved (ft)
  # bw_work_done_per_rep (ft lbs)

  #has_many :reps



  # timestamps

  # fields

  def type_name
    TYPE[self.exercise_type].to_s
  end

  #def weight_kg
  #  self.weight*0.453592
  #end
  #
  #def distance_m
  #  self.distance*0.0254
  #end

  class << self
    def clean(text)
      return text if text.blank?
      text.split(/(\s)/).collect{ |word| clean_word(word) }.join
    end

    def clean_word(word)
      #return word unless(word.strip.size > 2)

      if word.index(/[\W]/)
        word = word.split(/(\W)/).collect{ |subword| clean_word(subword) }.join
        concat = word.gsub(/\W/, '')
        word = concat if banned? concat
      end

      approved?(word) ? replacement(word) : word
    end

    def approved?(word = '')
      COMPONENTS.include?(word) if word
    end
  end

  def self.model_syntax(s)
    # this will get any string into syntax that uses the user model
    # this will also delete any words that are not in the approved word list
    # replace all approved words with u
    COMPONENTS.each do |c|
      s.gsub!(/(c)/,'u.\1')
    end
    s
  end
end
