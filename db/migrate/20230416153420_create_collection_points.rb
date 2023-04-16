class CreateCollectionPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :collection_points do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :contact
      t.string :website

      t.timestamps
    end
  end
end
