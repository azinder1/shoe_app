class RenameJoinTableAgain < ActiveRecord::Migration[5.0]
  def change
    drop_table(:brands_stroes)
    create_table(:brands_stores) do |t|
      t.column(:store_id, :integer)
      t.column(:brand_id, :integer)
    end
  end
end
