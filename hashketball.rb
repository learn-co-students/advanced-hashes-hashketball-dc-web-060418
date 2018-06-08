require 'pry'

def game_hash
  { home: {
     team_name: "Brooklyn Nets",
     colors: ["Black", "White"],
     players: {
       "Alan Anderson" => {
         number: 0,
         shoe: 16,
         points: 22,
         rebounds: 12,
         assists: 12,
         steals: 3,
         blocks: 1,
         slam_dunks: 1
       },
       "Reggie Evans" => {
         number: 30,
         shoe: 14,
         points: 12,
         rebounds: 12,
         assists: 12,
         steals: 12,
         blocks: 12,
         slam_dunks: 7
       },
       "Brook Lopez" => {
         number: 11,
         shoe: 17,
         points: 17,
         rebounds: 19,
         assists: 10,
         steals: 3,
         blocks: 1,
         slam_dunks: 15
       },
       "Mason Plumlee" => {
         number: 1,
         shoe: 19,
         points: 26,
         rebounds: 12,
         assists: 6,
         steals: 3,
         blocks: 8,
         slam_dunks: 5
       },
       "Jason Terry" => {
         number: 31,
         shoe: 15,
         points: 19,
         rebounds: 2,
         assists: 2,
         steals: 4,
         blocks: 11,
         slam_dunks: 1
       }
     }
   },
   away: {
     team_name: "Charlotte Hornets",
     colors: ["Turquoise", "Purple"],
     players: {
       "Jeff Adrien" => {
         number: 4,
         shoe: 18,
         points: 10,
         rebounds: 1,
         assists: 1,
         steals: 2,
         blocks: 7,
         slam_dunks: 2
       },
       "Bismak Biyombo" => {
         number: 0,
         shoe: 16,
         points: 12,
         rebounds: 4,
         assists: 7,
         steals: 7,
         blocks: 15,
         slam_dunks: 10
       },
       "DeSagna Diop" => {
         number: 2,
         shoe: 14,
         points: 24,
         rebounds: 12,
         assists: 12,
         steals: 4,
         blocks: 5,
         slam_dunks: 5
       },
       "Ben Gordon" => {
         number: 8,
         shoe: 15,
         points: 33,
         rebounds: 3,
         assists: 2,
         steals: 1,
         blocks: 1,
         slam_dunks: 0
       },
       "Brendan Haywood" => {
         number: 33,
         shoe: 15,
         points: 6,
         rebounds: 12,
         assists: 12,
         steals: 22,
         blocks: 5,
         slam_dunks: 12
       }
     }
   }
 }
end

def num_points_scored(player)
  points = 0
  game_hash.each do |team, players_hash|
    players_hash[:players].each do |name, info|
      if name == player
        points = info[:points]
         break
      end
    end
  end
  points
end

def shoe_size(player)
  shoe = 0
  game_hash.each do |team, players_hash|
    players_hash[:players].each do |name, info|
      if name == player
        shoe = info[:shoe]
         break
      end
    end
  end
  shoe
end

def team_colors(team_name)
  colors = ""
  game_hash.each do |team, info|
    if team_name == game_hash[team][:team_name]
      colors = info[:colors]
    end
  end
  colors
end

def team_names
  team_name = []
  game_hash.each do |team, info|
    team_name << info[:team_name]
  end
  team_name
end

def player_numbers(team_name)
  number = []
  game_hash.each do |team, players_hash|
    if team_name == game_hash[team][:team_name]
      players_hash[:players].each do |name, info|
       number << info[:number]
      end
    end
  end
  number
end

def player_stats(player)
  new_stats = {}
  game_hash.each do |team, players_hash|
    players_hash[:players].collect do |name, stats|
      if name == player
        new_stats = stats
      end
    end
  end
  new_stats
end

def big_shoe_rebounds
  biggest_shoe = 1
  rebounds = 0

  game_hash.each do |team, team_hash|
    team_hash[:players].each do |name, info|
      if info[:shoe] > biggest_shoe
        biggest_shoe = info[:shoe]
        rebounds = info[:rebounds]
      end
    end
  end
  rebounds
end
