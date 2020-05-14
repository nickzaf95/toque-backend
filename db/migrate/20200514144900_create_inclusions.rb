class CreateInclusions < ActiveRecord::Migration[6.0]
  def change
    create_table :inclusions do |t|
      t.references :family, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
