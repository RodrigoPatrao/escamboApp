class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :member
  # Money-rails
  monetize :price_cents, as: :price
  # Paperclip
  has_attached_file :picture, styles: { medium: "320x150>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  # Validação
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  validates_presence_of :title, :description, :price, :category_id, :picture
end
