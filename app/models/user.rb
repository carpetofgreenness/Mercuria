class User < ApplicationRecord
  has_many :boats, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :jobs

  def all_my_boats(job_id)

  	boat_jobs = BoatJob.where(job_id: job_id)

  	(self.boats - Boat.find(boat_jobs.map(&:boat_id))).map{ |e| [e.name, e.id] }
  end

  def all_my_jobs(boat_id)
    boat_jobs = BoatJob.where(boat_id: boat_id)
    (self.jobs - Job.find(boat_jobs.map(&:job_id))).map{ |e| [e.name, e.id] }
  end

  def full_name
    fullname = self.first_name + " " + self.last_name
  end
end

# look in boat_jobs to find what boats are assigned to job_id
# look in self.boats and omit boats from array above