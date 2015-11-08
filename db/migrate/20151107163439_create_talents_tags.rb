class CreateTalentsTags < ActiveRecord::Migration
  def change
    create_table :talents_tags do |t|
    	t.integer :talent_id
    	t.integer :tag_id
    end
  end
end