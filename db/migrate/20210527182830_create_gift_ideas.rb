class CreateGiftIdeas < ActiveRecord::Migration[6.0]
  def change
    create_table :gift_ideas do |t|
      t.references :friend, null: false, foreign_key: true
      t.references :gift, null: false, foreign_key: true

      t.timestamps
    end
  end
end
