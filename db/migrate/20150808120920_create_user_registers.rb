class CreateUserRegisters < ActiveRecord::Migration
  def change
    create_table :user_registers do |t|
     #core login
     t.string :email
     t.string :password_digest

     #credentials
     t.string :first_name
     t.string :last_name
     t.string :organization
     t.string :country
     
     #register need
     t.string :token
      t.timestamps null: false
    end
  end
end
