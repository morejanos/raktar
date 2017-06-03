class AddAttachmentImageToComponents < ActiveRecord::Migration
  def self.up
    change_table :components do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :components, :image
  end
end
