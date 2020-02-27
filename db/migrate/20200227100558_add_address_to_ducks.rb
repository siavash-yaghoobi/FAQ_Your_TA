class AddAddressToDucks < ActiveRecord::Migration[5.2]
  def change
    add_column :ducks , :address, :string
  end
end
