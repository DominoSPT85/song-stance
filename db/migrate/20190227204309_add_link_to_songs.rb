class AddLinkToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :link, :string
  end
end
