class User < ApplicationRecord
    belongs_to :team
    has_many :tasks 
    has_many :lists, through: :tasks 

end