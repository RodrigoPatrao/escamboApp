class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :member
  # Money-rails
  monetize :price_cents, as: :price
  # Paperclip
  has_attached_file :picture, styles: { medium: "320x150>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  # Validação
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  validates :title, :description, :picture, :price, :category_id, :finish_date, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 001 }
end
