class CreateJoinTableCollectionPointRecyclableMaterial < ActiveRecord::Migration[7.0]
  def change
    create_join_table :collection_points, :recyclable_materials do |t|
      t.index :collection_point_id, name: 'cp_rm_cp_id_idx'
      t.index :recyclable_material_id, name: 'cp_rm_rm_id_idx'
    end
  end
end
