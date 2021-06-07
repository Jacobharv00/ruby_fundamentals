require 'pry'

def print_name(name)
  puts name
  name
end

def starts_with_a_d?(name)
  name[0].downcase == 'd'
end

def print_names(names)
  names.each do |name|
    puts name
  end
end

names = ['Joaquin', 'Yisrael', 'Megan', 'Francisco', 'Json', 'Jami', 'Leon', 'Dakota']

def favorite_meals
  {
    breakfast: ["Bacon & Scrambled Eggs"],
    lunch: ["BLT"],
    dinner: ["Spinach Curry"]
  }
  {
    "breakfast" => ["Bacon & Scrambled Eggs"],
    "lunch" => ["BLT"],
    "dinner" => ["Spinach Curry"]
  }
end
print_names(names)

# binding.pry


def get_episodes_by_season(season_number)
  episodes = friends["_embedded"]["episodes"]
  episodes.select {|episode| episode["season"] == season_number}
end

def who_played(character_name)
  cast = friends["_embedded"]["cast"]
  cast_member = cast.find {|cast_member| cast_member["character"]["name"] == character_name }
  cast_member["person"]["name"]
end

def get_episode_names
  friends["_embedded"]["episodes"].map {|episode| episode["name"]}
end