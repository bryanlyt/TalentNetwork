class Project < ActiveRecord::Base
	belongs_to :creator, class_name: 'User'
	has_many :talents, dependent: :destroy

	validates :name, :description, :location, :creator_id, presence: true
	validates :name, uniqueness: true

	def to_s
    name
  end

end
