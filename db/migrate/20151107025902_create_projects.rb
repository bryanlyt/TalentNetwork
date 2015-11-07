class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.string :name
    	t.text :description
    	t.string :location
    	t.integer :creator_id

      t.timestamps null: false
    end
  end
end
