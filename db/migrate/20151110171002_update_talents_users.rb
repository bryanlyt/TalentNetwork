class UpdateTalentsUsers < ActiveRecord::Migration
  def change
  	rename_table :talents_users, :talent_applications
    add_column :talent_applications, :created_at, :datetime
    add_column :talent_applications, :updated_at, :datetime
    add_column :talent_applications, :chosen, :boolean, default: false
  end
end