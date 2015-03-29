class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password

      t.integer :permission_id

      t.timestamps null: false
    end
  end
end
