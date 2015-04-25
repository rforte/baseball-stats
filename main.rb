require 'rubygems'
require 'mechanize'
require 'open-uri'
require './player.rb'

a = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
}

players = []
player_sets = {}

a.get("http://www.rotowire.com/daily/mlb/value-report.htm") do |page|
    rows = page.search('table').search('tr')
    rows.each do |row|
        player = Player.new(row.search('td').map{ |n| n.text })
        #player.display
        players << player
    end

    active_players = players.select { |p| p.fp_today > 0.0 }

    active_players.each do |ap|
        pos = ap.position
        player_sets[pos] = [] unless player_sets.has_key?(pos)
        player_sets[pos] << ap
    end

    # player_sets["P"].each do |pitcher|
    #     pitcher.display
    # end
    # pp active_players.count

    pp player_sets.keys
end

#teams = [player_sets["P"], player_sets["C"], player_sets["1B"], player_sets["2B"], player_sets["3B"], player_sets["SS"]]

teams = [player_sets["P"], player_sets["C"] ]#, player_sets["1B"], player_sets["2B"], player_sets["3B"], player_sets["SS"]]

t1 = Time.now
combinations = teams.inject(&:product).map(&:flatten)
t2 = Time.now

delta = t2 - t1

pp "Completed in #{delta} milliseconds"
# combinations.each do |team|
#     pp "#{team[0].name} : #{team[1].name}"
# end