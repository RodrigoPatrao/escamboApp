class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :member
  # money-rails
  monetize :price_cents, as: :price
  # paperclip
  has_attached_file :picture, styles: { medium: "320x150", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
