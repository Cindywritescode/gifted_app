class ChangeGiftPrice < ActiveRecord::Migration[6.0]
  def change
    change_column :gifts, :price, :float
  end
end
