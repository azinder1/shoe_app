class AddColumnsToStore < ActiveRecord::Migration[5.0]
  def change
    add_column(:stores, :street_address, :string)
    add_column(:stores, :city, :string)
    add_column(:stores, :state, :string)
    add_column(:stores, :zip_code, :integer)
  end
end
