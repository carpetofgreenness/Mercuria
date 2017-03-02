class Job < ApplicationRecord
	belongs_to :user
	has_many :boat_jobs
	has_many :boats, through: :boat_jobs
	validates :origin, inclusion: {in: Locations::LOCATIONS}
	validates :destination, inclusion: {in: Locations::LOCATIONS}
end
