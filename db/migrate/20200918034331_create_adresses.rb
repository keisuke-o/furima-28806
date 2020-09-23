class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.integer    :prefecture_id,     null: false
      t.string     :city,              null: false
      t.string     :adress,            null: false
      t.string     :zip_code,          null: false
      t.string     :telephone,          null: false
      t.string     :building
      t.references :order,             null: false, FK: true

      t.timestamps
    end
  end
end
