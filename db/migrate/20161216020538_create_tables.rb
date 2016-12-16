class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table(:stores) do |t|
      t.column(:name, :varchar)
    end
    create_table(:brand) do |t|
      t.column(:shoe_id, :integer)
      t.column(:store_id, :integer)
      t.column(:brand_name, :integer)
      t.column(:price, :integer)
    end
  end
end
