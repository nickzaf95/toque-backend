class AddCodeToFamilies < ActiveRecord::Migration[6.0]
  def change
    add_column :families, :code, :string
  end
end
