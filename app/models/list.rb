class List < ApplicationRecord
    has_many :tasks
    has_many :users, through: :tasks 

    def completed
        if self.tasks.all? {|task| task.complete }
            self.update(complete: true)
            return "Done!"
        else
            self.complete 
            return "Incomplete"
        end
    end

    def team
        self.tasks.map {|task| task.user.team}
    end
end
