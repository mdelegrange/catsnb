class AddCoordinatesToCats < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :address, :string
    add_column :cats, :latitude, :float
    add_column :cats, :longitude, :float
  end
end
