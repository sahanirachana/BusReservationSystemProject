class Busdetail < ApplicationRecord
    belongs_to :user
    belongs_to :route
    has_many :reservations,dependent: :destroy
    
    def self.search(search)
        # where("bus_name LIKE ?",  "%#{search}%")
        where("bus_name LIKE ?", "%#{search}%")
    end

    
end
