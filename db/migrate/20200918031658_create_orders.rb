class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references   :user,   null: false, FK: true
      t.references   :item,   null: false, FK: true


      t.timestamps
    end
  end
end
