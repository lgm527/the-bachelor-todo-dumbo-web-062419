
=begin
data structure levels
hash, array, hash
Hash => keys = season number//(string) => values = [{contestant1}, {contestant2}]//(array of hashes)
bachelor_hash = {1: [{name, age}, {name, age}], 2: ["dan", "ben"]}
next level...
each contestant is their own hash of info
...[{name, age}{name, age}{name, age}]
=end

def get_first_name_of_season_winner(data, season)
  winner = ""
  winner_first = ""
  data.each do |the_season, contestants|
    if the_season == season
      contestants.each do |stats|
        if stats["status"] == "Winner"
          winner = stats["name"]
          winner_first = winner.split(" ")
        end
      end
    end
  end
  winner_first[0]
end

def get_contestant_name(data, occupation)
  data.each do |the_season, contestants|
    contestants.each do |stats|
    return stats["name"] if stats["occupation"] == occupation
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  ht_counter = 0
  data.each do |the_season, contestants|
    contestants.each do |stats|
      if stats["hometown"] == hometown
        ht_counter += 1
      end
    end
  end
  ht_counter
end

def get_occupation(data, hometown)
  data.each do |the_season, contestants|
    contestants.each do |stats|
      return stats["occupation"] if stats["hometown"] == hometown
    end
  end
end

def get_average_age_for_season(data, season)
  age_a = []
  data.each do |the_season, contestants|
    if the_season == season
      contestants.each do |stats|
          age_a << stats["age"].to_f
      end
    end
  end
  (age_a.inject(0.0) { |sum, el| sum + el } / age_a.size).round
end
