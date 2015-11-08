module Taggable
  extend ActiveSupport::Concern

  included do
    has_and_belongs_to_many :tags
  end

  def update_tags(*tag_names)
    transaction do
      tags.each do |tag|
        tags.delete(tag) unless tag_names.include?(tag.name)
      end

      tag_names.each do |name|
        tag = Tag.find_or_create_by(name: name)
        tags << tag unless tags.include?(tag)
      end
    end
  end

  def tag_names
    tags.map(&:name)
  end
end
