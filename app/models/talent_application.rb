class TalentApplication < ActiveRecord::Base

	# include Elasticsearch::Model
 #  include Elasticsearch::Model::Callbacks

	belongs_to :talent
	belongs_to :user

	delegate :tags, to: :user, prefix: true
end