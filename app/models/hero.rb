class Hero < ApplicationRecord
    validates :name, presence: true, uniqueness: { case_sensitive: false}, length: {minimum: 4}

    scope :search, ->(name) { where('name LIKE ?', "%#{name}%") if name.present? }
    scope :sorted_by_name, -> { order(:name) }
end
