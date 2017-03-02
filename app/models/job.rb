class Job < ApplicationRecord
	belongs_to :user
	has_many :boat_jobs
	has_many :boats, through: :boat_jobs
	validates :origin, inclusion: {in: Locations::LOCATIONS}
	validates :destination, inclusion: {in: Locations::LOCATIONS}

	def find_boatjob(boat)
		boatjob = BoatJob.where(:job_id==self.id && :boat_id ==boat.id)
		# byebug
		boatjob
	end

end
