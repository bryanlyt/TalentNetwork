class FixCreateTalents < ActiveRecord::Migration
  def change
  	rename_column :talents, :found, :payment
  end
end
