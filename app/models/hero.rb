class Hero < ApplicationRecord
    validates :name, presence: true

    scope :search, ->(nome) { where('name LIKE ?', "%#{nome}%") if nome.present? }
    scope :sorted_by_name, -> { order(:name) }
end
