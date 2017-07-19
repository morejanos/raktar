class AddPurchaseInfoToComponents < ActiveRecord::Migration
  def change
    add_column :components, :purchase_date, :timestamp
    add_column :components, :purchase_arrival_date, :timestamp
  end
end
