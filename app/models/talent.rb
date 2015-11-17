class Talent < ActiveRecord::Base

  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
	
  include Taggable

	default_scope { where(active: true) }

	belongs_to :project
	has_many :talent_applications
	has_many :users, through: :talent_applications

	validates :project, :name, :description, presence: true

	delegate :name, :location, to: :project, prefix: true
	delegate :creator, to: :project

	def self.suitable_for(user)
		eager_load(:tags).joins(:tags).where('tags.name' => user.tag_names).distinct
	end

	def to_s
		name
	end

	def created_by?(user)
		creator == user
	end

end
