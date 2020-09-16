class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id,         null: false, FK: true
      t.integer :category_id,     null: false       
      t.integer :condition_id,    null: false         
      t.integer :shipping_id,     null: false         
      t.integer :prefecture_id,   null: false    
      t.integer :delivery_day_id, null: false    
      t.string  :name,            null: false    
      t.integer :price,           null: false    
      t.text :describe,            null: false 
      t.timestamps
    end
  end
end
