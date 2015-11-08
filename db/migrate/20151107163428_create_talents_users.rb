class CreateTalentsUsers < ActiveRecord::Migration
  def change
    create_table :talents_users do |t|
    	t.integer :talent_id
    	t.integer :user_id
    end
  end
end

