class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :name
      t.string :partnumber
      t.integer :inventory
      t.string :inductivity
      t.string :power
      t.string :voltage
      t.string :current
      t.string :resistance
      t.string :dimension
      t.string :temperature
      t.string :capacity
      t.string :location
      t.string :comment
      t.integer :criticalNrOfPieces

      t.integer :packaging_id
      t.integer :manufacturer_id
      t.integer :user_id
      t.integer :componenttype_id

      t.timestamps null: false
    end
  end
end
