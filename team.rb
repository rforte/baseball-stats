class Team
    def self.value(players, salary_cap)
        salary, ep = 0, 0.0
        players.each do |p|
            salary += p.salary
            ep += p.fp_today

            return 0.0 if salary > salary_cap
        end

        #[salary, ep]
        ep
    end
end