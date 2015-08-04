class AlterUser < ActiveRecord::Migration
  def change
    add_column :users, :organization, :string
    add_column :users, :country, :string
  end
end
