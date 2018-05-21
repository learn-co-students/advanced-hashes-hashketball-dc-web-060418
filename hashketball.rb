# Write your code here!
require "pry"
def game_hash
  game_hash = {
      home: {
        team_name: "Brooklyn Nets",
        colors: ["Black", "White"],
        players: {
          "Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
          "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
          "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
          "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
          "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
          }
        },
      away:{
        team_name: "Charlotte Hornets",
        colors: ["Turquoise", "Purple"],
        players: {
          "Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
          "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
          "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
          "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
          "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
        }
      }
    }
end
#formats incase needed later:
# "" => {number:, shoe:, points:, rebounds:, assists:, steals:, blocks:, slam_dunks:},
# {team_name: "", colors: [], players: {"" => {number:  , shoe:  , points: , rebounds:  , assists:   , steals:  , blocks:  , slam_dunks:  }}}

def num_points_scored(player_name)
#Build a method, num_points_scored that takes in an argument of a player's name and returns the number of points scored for that player.

  if game_hash[:home][:players].include?(player_name) == true
    game_hash[:home][:players][player_name].values_at(:points).join().to_i
  elsif game_hash[:away][:players].include?(player_name) == true
    game_hash[:away][:players][player_name].values_at(:points).join().to_i
  end
end

def shoe_size(player_name)
#Build a method, shoe_size, that takes in an argument of a player's name and returns the shoe size for that player.
  if game_hash[:home][:players].include?(player_name) == true
    game_hash[:home][:players][player_name].values_at(:shoe).join().to_i
  elsif game_hash[:away][:players].include?(player_name) == true
    game_hash[:away][:players][player_name].values_at(:shoe).join().to_i
  end
end

def team_colors(team_name)
#Build a method, team_colors, that takes in an argument of the team name and returns an array of that teams colors.
  if game_hash[:home][:team_name].include?(team_name) == true
    game_hash[:home].values_at(:colors).flatten!
  elsif game_hash[:away][:team_name].include?(team_name) == true
    game_hash[:away].values_at(:colors).flatten!
  end
end

def team_names
#Build a method, team_names, that operates on the game hash to return an array of the team names.
team_names_array = []
  game_hash.each {|location, team_info| team_names_array.push(game_hash[location].values_at(:team_name))}
team_names_array.flatten!
end

def player_numbers(team_name)
#Build a method, player_numbers, that takes in an argument of a team name and returns an array of the jersey number's for that team.
jersey_numbers_array = []
  if game_hash[:home][:team_name].include?(team_name) == true
    game_hash[:home][:players].each do |player_name, player_info|
        jersey_numbers_array.push(game_hash[:home][:players][player_name].values_at(:number))
    end
  elsif game_hash[:away][:team_name].include?(team_name) == true
    game_hash[:away][:players].each do |player_name, player_info|
        jersey_numbers_array.push(game_hash[:away][:players][player_name].values_at(:number))

    end
  end
  jersey_numbers_array.flatten!
end

def player_stats(player_name)
#Build a method, player_stats, that takes in an argument of a player's name and returns a hash of that player's stats.
  if game_hash[:home][:players].include?(player_name) == true
    game_hash[:home][:players].values_at(player_name)[0]
  elsif game_hash[:away][:players].include?(player_name) == true
    game_hash[:away][:players].values_at(player_name)[0]
  end
end

def big_shoe_rebounds
#Build a method, big_shoe_rebounds, that will return the number of rebounds associated with the player that has the largest shoe size. Break this one down into steps:
# First, find the player with the largest shoe size
# Then, return that player's number of rebounds
# Remember to think about return values here. Use binding.pry to drop into your method and understand what it is returning and why.
  #get largest home team shoe_size
home_team_shoe_size = []
away_team_shoe_size = []
  game_hash[:home][:players].each do |player_name, player_info|
    home_team_shoe_size.push(game_hash[:home][:players][player_name].values_at(:shoe))
  end
  #get largest away team shoe_size
  game_hash[:away][:players].each do |player_name, player_info|
    away_team_shoe_size.push(game_hash[:away][:players][player_name].values_at(:shoe))
  end
  home_team_shoe_size.flatten!
  away_team_shoe_size.flatten!

  biggest_home_team_shoe = home_team_shoe_size.sort[-1]
  biggest_away_team_shoe = away_team_shoe_size.sort[-1]
#compaire two values_at return the rebounds of the player_name assosicate with that values
  if biggest_home_team_shoe > biggest_away_team_shoe
    home_key = ""
    game_hash[:home][:players].each do |player_name, player_info|
      if player_info.values_at(:shoe).join().to_i == biggest_home_team_shoe
        home_key = player_name
      end
    end
    game_hash[:home][:players][home_key].values_at(:rebounds).join().to_i

  elsif biggest_away_team_shoe > biggest_home_team_shoe
    away_key = ""
    game_hash[:away][:players].each do |player_name, player_info|
      player_info.each do |player_info, attribute|


        #####look at this next time didn't test yet
        if player_info.values_at(:shoe).join().to_i == biggest_away_team_shoe
          away_key = player_name
        end
      end
    end
    game_hash[:away][:players][away_key].values_at(:rebounds).join().to_i

  end

end

# Bonuses:
# Define methods to return the answer to the following questions:
#
# Which player has the most points? Call the method most_points_scored.
#
# Which team has the most points? Call the method winning_team.
#
# Which player has the longest name? Call the method player_with_longest_name.
#
# Super Bonus:
#
# Write a method that returns true if the player with the longest name had the most steals. Call the method long_name_steals_a_ton?.
