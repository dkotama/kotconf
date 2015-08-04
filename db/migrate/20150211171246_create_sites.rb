class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
	  t.integer :master_id
      t.string :headline_title
      t.string :headline_text
      t.string :bg_img_file_name
      t.string :bg_text
      
      t.timestamps null: false
    end
  end
end
