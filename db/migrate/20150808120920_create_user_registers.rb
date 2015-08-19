class CreateUserRegisters < ActiveRecord::Migration
  def change
    create_table :user_registers do |t|

      t.timestamps null: false
    end
  end
end
