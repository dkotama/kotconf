class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators, :id => false do |t|
      t.integer :master_id
      t.integer :user_id
      t.timestamps null: false
    end
    add_index :administrators, ["master_id","user_id"]
  end
end
