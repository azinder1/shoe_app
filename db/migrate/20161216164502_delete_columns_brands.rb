class DeleteColumnsBrands < ActiveRecord::Migration[5.0]
  def change
    remove_column(:brands, :price)
    remove_column(:brands, :brand_name)
  end
end
