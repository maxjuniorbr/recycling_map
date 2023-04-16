class RecyclableMaterial < ApplicationRecord
  has_and_belongs_to_many :collection_points
end
