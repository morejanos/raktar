class CreateComponenttypes < ActiveRecord::Migration
  def change
    create_table :componenttypes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
