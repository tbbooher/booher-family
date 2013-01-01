require 'csv'

namespace :data do

  desc "load all exercise data"
  task :load_exercise_data => :environment do
    Exercise.destroy_all
    CSV.foreach("#{Rails.root}/public/workout_formulas.csv", headers: true) do |row|
      h = row.to_hash
      e = Exercise.new
      puts "loading #{h['Name']} ..."
      e.name = h['Name']
      e.bw_total_weight_moved_1 = h["BW Total Weight Moved (Part 1) (lbs)"]
      e.bw_total_weight_moved_2 = h["BW Total weight Moved (Part 2) (lbs)"]
      e.bw_distance_moved_1 = h["BW Distance Moved (Part 1) (feet)"]
      e.bw_distance_moved_2 = h["BW Distance Moved (Part 2) (feet)"]
      e.weight_distance_moved = h["Weight Distance Moved (feet)"]
      e.bw_work_done_per_rep = h["BW Work Done Per Rep\r(ft-lbs)"]
      e.save
    end
  end

  desc "load exercise names"
  task :load_exercise_names => :environment do
    %q{Back Extension
    Bench Press
    Box Jump
    Burpee
    Clean & Jerk (Power Clean)
    Deadlift
    Dip
    Double Under
    Empty
    Front Squat
    GHD Situp
    Handstand Pushup
    Hang Power Clean
    Hang Power Snatch
    Hang Squat Clean
    Hang Squat Snatch
    Hip & Back Extension
    Hip Extension
    Kettlebell Swing
    Knees to Elbows
    L-Pullup
    Medicine Ball Clean
    Muscle up
    OHS
    Pistol
    Power Clean
    Power Snatch
    Press
    Pullup
    Push Press
    Push Jerk
    Pushup
    Ring Dip
    Rope Climb
    Row (Very rough estimate)
    Run (Very rough estimate)
    Situp
    Squat
    Squat Clean
    Squat Clean & Jerk
    Squat Snatch
    Sumo Deadlift High Pull
    Thruster
    Wall Ball
    Walking Lunge}.split("\n").each do |exercise_name|
      e = Exercise.new
      e.name = exercise_name
      e.save
    end
  end

  desc "move data into model from mongodb"
  task :move_data_over => :environment do

    include Mongo

    client = MongoClient.new('localhost', 27017)
    db     = client['booher_life_development']
    coll   = db['journal_entries']

    JournalEntry.destroy_all

    coll.find.each do |j|
      je = JournalEntry.new
      date_string = j["entry_date"].to_s
      puts "Parsing #{date_string} with id #{j["_id"]}"
      if date_string.empty?
        date_string = Date.today.to_s
      end
      je.entry_date = Date.parse(date_string)
      je.description = j["description"]
      je.purity = j["purity"]
      je.lack_of_discipline = j["lack_of_discipline"]
      je.fitness = j["fitness"]
      je.devotional = j["devotional"]
      je.chrissy = j["chrissy"]
      je.relational = j["relational"]
      je.discipline = j["discipline"]
      je.facepicking = j["facepicking"]
      je.stress = j["stress"]
      je.sick = j["sick"]
      je.flossed = j["flossed"]
      je.workout = j["workout"]
      je.health_statement = j["health_statement"]
      je.to_do = j["to_do"]
      je.memory_verse = j["memory_verse"]
      je.friends_in_focus = j["friends_in_focus"]
      je.problem_of_the_day = j["problem_of_the_day"]
      je.problem_attempted = j["problem_attempted"]
      je.problem_solved = j["problem_solved"]
      #je.created_at = Date.parse(j["created_at"])
      je.save!
      puts "#{j["entry_date"]} saved #{je.id}"
    end

  end

  desc "examine journal entries in the mongo db"
  task :describe_mongo_data => :environment do

    include Mongo

    client = MongoClient.new('localhost', 27017)
    db     = client['booher_life_development']
    coll   = db['journal_entries']

    JournalEntry.destroy_all

    coll.find.each do |j|
      #je = JournalEntry.new
      date_string = j["entry_date"].to_s
      puts "Examining #{date_string}"
      puts "health: #{j["health_statement"].to_s.size}"
      puts "friends: #{j["friends_in_focus"].to_s.size}"
    end

  end

end