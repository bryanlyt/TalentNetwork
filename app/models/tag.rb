class Tag < ActiveRecord::Base

  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
  
	has_and_belongs_to_many :users
	has_and_belongs_to_many :talents

	validates :name, presence: true, uniqueness: true
end