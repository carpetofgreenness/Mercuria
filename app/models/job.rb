class Job < ApplicationRecord
	belongs_to :user
	has_many :boat_jobs
	has_many :boats, through: :boat_jobs

	validates :origin, inclusion: {in: Locations::LOCATIONS}
	validates :destination, inclusion: {in: Locations::LOCATIONS}
	validates_presence_of :name, :origin, :destination, :cost, :containers, :description
	validates :cost, :numericality => { :greater_than_or_equal_to => 1000 }	
	validates_length_of :description, :minimum => 50


	def find_boatjob(boat)
		BoatJob.where(job_id: self.id, boat_id: boat.id).first.id
	end

end
