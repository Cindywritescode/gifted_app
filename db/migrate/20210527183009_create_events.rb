class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_type
      t.date :date
      t.references :friend, null: false, foreign_key: true

      t.timestamps
    end
  end
end
