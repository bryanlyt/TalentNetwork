class ChangeTalentsTagsToTagsTalents < ActiveRecord::Migration
  def change
  	rename_table :talents_tags, :tags_talents
  end
end
