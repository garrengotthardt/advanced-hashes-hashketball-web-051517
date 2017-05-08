# Write your code here!
require "pry"

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1,
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7,
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15,
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5,
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1,
        },
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2,
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10,
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5,
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0,
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12,
        },
      }
    }
  }
end

def num_points_scored(name)
  game_hash.each do |key_level_1, value_level_1|
    value_level_1.each do |key_level_2, value_level_2|
      if key_level_2 == :players
        value_level_2.each do |key_level_3, value_level_3|
          if key_level_3 == name
              return game_hash[key_level_1][key_level_2][name][:points]
          end
        end
      end
    end
  end
end



def shoe_size(name)
  game_hash.each do |key_level_1, value_level_1|
    value_level_1.each do |key_level_2, value_level_2|
      if key_level_2 == :players
        value_level_2.each do |key_level_3, value_level_3|
          if key_level_3 == name
              return game_hash[key_level_1][key_level_2][name][:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team_status, team_data|
    if game_hash[team_status][:team_name] == team_name
      return  game_hash[team_status][:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do |key_level_1, value_level_1|
    value_level_1.each do |key_level_2, value_level_2|
      if key_level_2 == :team_name
          teams << game_hash[key_level_1][key_level_2]
      end
    end
  end
  return teams
end


def player_numbers(team_name)
  jersey_numbers_array = []
  game_hash.each do |key_level_1, value_level_1|
    if game_hash[key_level_1][:team_name] == team_name
      value_level_1.each do |key_level_2, value_level_2|
        if key_level_2 == :players
          value_level_2.each do |key_level_3, value_level_3|
            jersey_numbers_array << game_hash[key_level_1][key_level_2][key_level_3][:number]
          end
        end
      end
    end
  end
  return jersey_numbers_array.sort
end

def player_stats(name)
  game_hash.each do |key_level_1, value_level_1|
    value_level_1.each do |key_level_2, value_level_2|
      if key_level_2 == :players
        value_level_2.each do |key_level_3, value_level_3|
          if key_level_3 == name
            return game_hash[key_level_1][key_level_2][name]
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  player_shoe_hash = Hash.new
  game_hash.each do |key_level_1, value_level_1|
    value_level_1.each do |key_level_2, value_level_2|
      if key_level_2 == :players
        value_level_2.each do |key_level_3, value_level_3|
          player_shoe_hash[key_level_3] = game_hash[key_level_1][:players][key_level_3][:shoe]
        end
      end
    end
  end
  player_biggest_shoe = player_shoe_hash.max_by{|k,v| v}
  name = player_biggest_shoe[0]
  game_hash.each do |key_level_1, value_level_1|
    value_level_1.each do |key_level_2, value_level_2|
      if key_level_2 == :players
        value_level_2.each do |key_level_3, value_level_3|
          if key_level_3 == name
            return game_hash[key_level_1][key_level_2][name][:rebounds]
          end
        end
      end
    end
  end
end
