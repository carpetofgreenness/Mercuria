class Boat < ApplicationRecord
	belongs_to :user
	validates_presence_of :name, :location, :container_num
	has_many :boat_jobs
	has_many :jobs, through: :boat_jobs
end
