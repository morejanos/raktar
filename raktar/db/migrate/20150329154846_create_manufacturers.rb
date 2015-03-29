class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.string :contactPerson
      t.string :address
      t.string :email
      t.string :phone
      
      t.timestamps null: false
    end
  end
end
