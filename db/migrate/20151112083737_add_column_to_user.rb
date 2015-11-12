class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :website, :string
    add_column :users, :gender, :string
    add_column :users, :description, :text
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :date_of_birth, :date
  end
end
