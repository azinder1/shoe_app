class DeleteAddColumnsBrandsAgain < ActiveRecord::Migration[5.0]
  def change
    remove_column(:brands, :type)
    add_column(:brands, :shoe_type, :string)
  end
end
