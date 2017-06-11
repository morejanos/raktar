class AddStatusRefToComponents < ActiveRecord::Migration
  def change
    add_reference :components, :status, index: true
    add_foreign_key :components, :statuses
  end
end
