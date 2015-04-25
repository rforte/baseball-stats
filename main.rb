require 'rubygems'
require 'mechanize'
require 'open-uri'
require './player.rb'

a = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
}

players = []

a.get("http://www.rotowire.com/daily/mlb/value-report.htm") do |page|
    rows = page.search('table').search('tr')
    rows.each do |row|
        player = Player.new(row.search('td').map{ |n| n.text })
        #player.display
        players << player
    end

    active_players = players.select { |p| p.fp_today > 0.0 }

    active_players.each do |ap|
        ap.display
    end

    pp active_players.count
end