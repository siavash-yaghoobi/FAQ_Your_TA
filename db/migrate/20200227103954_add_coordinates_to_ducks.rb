class AddCoordinatesToDucks < ActiveRecord::Migration[5.2]
  def change
    add_column :ducks, :latitude, :float
    add_column :ducks, :longitude, :float
  end
end
