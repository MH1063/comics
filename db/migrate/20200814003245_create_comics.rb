class CreateComics < ActiveRecord::Migration[5.2]
  def change
    create_table :comics do |t|
      t.string :tittle
      t.string :author
      t.string :price
      t.text :review
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
