class AddJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table(:brands_stroes) do |t|
      t.column(:store_id, :integer)
      t.column(:brand_id, :integer)
    end
  end
end
