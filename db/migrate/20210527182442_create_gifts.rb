class CreateGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :gifts do |t|
      t.text :gift_url
      t.string :product_name
      t.string :photo
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
