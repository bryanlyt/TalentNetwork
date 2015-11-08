class CreateTalents < ActiveRecord::Migration
  def change
    create_table :talents do |t|
    	t.integer :project_id
    	t.string :name
    	t.text :description
    	t.boolean :found

      t.timestamps null: false
    end
  end
end