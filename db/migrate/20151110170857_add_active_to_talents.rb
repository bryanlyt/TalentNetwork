class AddActiveToTalents < ActiveRecord::Migration
  def change
  	add_column :talents, :active, :boolean, default: true
  end
end