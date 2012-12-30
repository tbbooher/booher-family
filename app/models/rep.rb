class Rep < ActiveRecord::Base
  attr_accessible :exercise_id, :workout_id, :count, :seconds, :distance, :weight, :exercise_type
  belongs_to :workout
  belongs_to :exercise

  # remove exercise type

  #t.integer  "exercise_id"
  #t.integer  "workout_id"
  #t.integer  "count"
  #t.float    "seconds"
  #t.float    "distance" # in for lifts, mi for running
  #t.float    "weight"

  def power
    if e = self.exercise
      work_done_per_rep = e.work
    end


    # TYPE = {1 => :crossfit, 2 => :weight_lifting, 3 => :running}
    case self.exercise.exercise_type
      when 1,2 # crossfitworkout, lifting
        if self.exercise.distance_m && self.weight_kg && self.count && self.seconds
          (self.weight_kg*self.exercise.distance_m*self.count)/self.seconds
        else
          raise "no weight or distance specified"
        end
      when 3 # running
        v = self.distance_m/(self.time_min) # m/min
        # per A. CAVAGNA AND M. KANEKO (http://www.ncbi.nlm.nih.gov/pmc/articles/PMC1283673/pdf/jphysiol00809-0192.pdf)
        #cal_per_kg_min = 9.42 + 4.73*v + 0.266*v**(1.993)
        #w = self.exercise.weight*0.453592 # in kg
        #calories = (self.time_min)*cal_per_kg_min*w # watt
        #joules = calories*4.18400
        #puts calories
        #joules/self.seconds
        # new approach
        #USER ID:	e5216213@telecomitalia.it
        #PASSWORD:	PT1RLW7R
        grade = 0
        vo2=3.5+v*0.2+v*grade*0.9
        mets = vo2 / 3.5
        cal_per_hr = self.exercise.weight_kg*mets
        puts "distance: #{self.distance_m} (m)"
        puts "min: #{self.time_min}"
        puts "v: #{v} (m/min)"
        puts "exercise weight: #{self.exercise.weight_kg} (kg)"
        puts "calories per hour #{cal_per_hr}"
        puts "calories #{cal_per_hr*time_hr}"
        puts "mets: #{mets}"
        puts "vo2: #{vo2}"
        joules = cal_per_hr*self.time_hr*4.18400*1000 # convert cal to joules
        puts "joules: #{joules}"
        joules/self.seconds
      else
        raise "error -- unknown exercise type"
    end
  end

  def weight_kg
    # convert weight from lb to kg
    self.weight*0.453592
  end

  def distance_km
    # convert miles to km
    self.distance*1.60934
  end

  def time_min
    self.seconds/60
  end

  def time_hr
    self.time_min/60
  end

  def distance_m
    self.distance_km*1000
  end

end
