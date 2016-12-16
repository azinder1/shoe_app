class RenameBrandTable < ActiveRecord::Migration[5.0]
  def change
    drop_table(:brand)
    create_table(:brands) do |t|
      t.column(:shoe_id, :integer)
      t.column(:store_id, :integer)
      t.column(:brand_name, :integer)
      t.column(:price, :integer)
    end
  end
end
