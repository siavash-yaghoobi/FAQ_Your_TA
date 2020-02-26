class AddPriceToDucks < ActiveRecord::Migration[5.2]
  def change
    add_column :ducks, :price, :float
  end
end
