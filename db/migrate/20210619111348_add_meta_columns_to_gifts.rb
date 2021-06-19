class AddMetaColumnsToGifts < ActiveRecord::Migration[6.0]
  def change
    add_column :gifts, :meta_url, :text
    add_column :gifts, :meta_host, :string
    add_column :gifts, :meta_title, :string
    add_column :gifts, :meta_desciption, :string
  end
end
