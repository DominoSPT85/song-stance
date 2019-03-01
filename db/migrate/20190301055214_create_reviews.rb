class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :author
      t.text :body
      t.belongs_to :song, foreign_key: true

      t.timestamps
    end
  end
end
