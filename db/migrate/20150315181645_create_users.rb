class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
     #core login
     t.string :email
     t.string :password_digest

     #credentials
     t.string :first_name
     t.string	:last_name

     #activation
     t.boolean :active , :default => false
      t.timestamps null: false
    end
  end
end
