class CollectionPoint < ApplicationRecord
  has_and_belongs_to_many :recyclable_materials

  scope :search, lambda { |query|
    if query.present?
      where('name ILIKE ?', "%#{query}%")
    else
      all
    end
  }
end
