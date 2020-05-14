class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :image
      t.string :video
      t.text :ingredients
      t.text :method

      t.timestamps
    end
  end
end
