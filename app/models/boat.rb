class Boat < ApplicationRecord
	belongs_to :user
	validates_presence_of :name, :location, :container_num
	validates :name, uniqueness: true
	has_many :boat_jobs, dependent: :destroy
	has_many :jobs, through: :boat_jobs
	
	validates :location, inclusion: {in: Locations::LOCATIONS}

	has_attached_file :avatar, :styles =>
		{ :medium => "300x300>", :thumb => "100x100>" },
		:default_url => "/images/:style/missing.png"
		validates_attachment_content_type :avatar, 
		:content_type => /\Aimage\/.*\Z/


	def find_boatjob(job)
		BoatJob.where(boat_id: self.id, job_id: job.id).first.id
	end
end
