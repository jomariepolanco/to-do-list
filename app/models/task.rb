class Task < ApplicationRecord
    belongs_to :user 
    belongs_to :list 

    validates :complete, inclusion: { in: [true, false], message: "must be true or false"}
    validates :content, presence: true 

end