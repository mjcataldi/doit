class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null:false, limit: 128
      t.string :email, null:false, limit:128
      t.string :password_hash, null:false

      t.timestamps
    end
  end
end
