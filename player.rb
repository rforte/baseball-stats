class Player
# ["OF",
#  "Richardson, Antoan  DL-60",
#  "TEX",
#  "B",
#  "R",
#  "@LAA",
#  "Richards, G.",
#  "\r\n\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t\t\tBench\r\n\t\t\t\t\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\t\t\t\t",
#  "$2,500",
#  "0.0",
#  "0.0",
#  "0.0",
#  "0.0",
#  "0.0",
#  "0.0"]

    def initialize(tds)
        @pos = tds[0]
        @name = tds[1]
        @team = tds[2]
        @salary = tds[8].gsub(/\D/,'').to_i
        @fp_today = tds[9].to_f
        @value_today = tds[10].to_f
    end

    def display
        puts "#{@pos} : #{@name} #{@salary} : #{@value_today}"
    end

    def fp_today
        @fp_today
    end

    def position
        @pos
    end

    def name
        @name
    end

    def salary
        @salary
    end
end