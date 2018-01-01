class Category < ActiveRecord::Base
  has_many :ads, dependent: :destroy
  validates :description, presence: { message: "Descrição não pode ficar em branco." }
end
