class CreateDucks < ActiveRecord::Migration[5.2]
  def change
    create_table :ducks do |t|
      t.references :user, foreign_key: true
      t.string :category
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
