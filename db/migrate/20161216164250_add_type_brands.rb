class AddTypeBrands < ActiveRecord::Migration[5.0]
  def change
    add_column(:brands, :type, :string)
  end
end
