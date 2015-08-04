class CreateAuthorsJoin < ActiveRecord::Migration
  def change
    create_table :authors, :id => false do |t|
    	t.integer :master_id
    	t.integer :user_id
    	t.timestamps null: false
    end
    add_index :authors, ["master_id", "user_id"]
  end
end
