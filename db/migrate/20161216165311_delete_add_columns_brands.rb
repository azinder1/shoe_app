class DeleteAddColumnsBrands < ActiveRecord::Migration[5.0]
  def change
    remove_column(:brands, :shoe_id)
    remove_column(:brands, :store_id)
    add_column(:brands, :name, :string)
  end
end
