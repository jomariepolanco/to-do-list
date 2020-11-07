class Team < ApplicationRecord
    has_many :users
    has_many :tasks, through: :users 

    def lists
        self.tasks.map {|task| task.list}.uniq
    end
end