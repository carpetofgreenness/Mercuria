class Boat < ApplicationRecord
	belongs_to :user
	validates_presence_of :name, :location, :container_num
end
