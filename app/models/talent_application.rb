class TalentApplication < ActiveRecord::Base
	belongs_to :talent
	belongs_to :user

	delegate :tags, to: :user, prefix: true
end