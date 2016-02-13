class Entrepreneur < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :description

  has_attached_file :image_1, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  has_attached_file :image_2, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  has_attached_file :image_3, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  has_attached_file :image_4, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image_1, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :image_2, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :image_3, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :image_4, content_type: /\Aimage\/.*\Z/
end
