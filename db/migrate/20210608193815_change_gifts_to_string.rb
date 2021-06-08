class ChangeGiftsToString < ActiveRecord::Migration[6.0]
  def change
    change_column :gifts, :price, :string
  end
end
