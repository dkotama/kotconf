class CreateMasters < ActiveRecord::Migration
  def change
    create_table :masters do |t|
      t.string :url
      t.string :title

      t.timestamps null: false
    end
  end
end
