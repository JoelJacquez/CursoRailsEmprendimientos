class AddAttachmentImage1Image2Image3Image4ToEntrepreneurs < ActiveRecord::Migration
  def self.up
    change_table :entrepreneurs do |t|
      t.attachment :image_1
      t.attachment :image_2
      t.attachment :image_3
      t.attachment :image_4
    end
  end

  def self.down
    remove_attachment :entrepreneurs, :image_1
    remove_attachment :entrepreneurs, :image_2
    remove_attachment :entrepreneurs, :image_3
    remove_attachment :entrepreneurs, :image_4
  end
end
