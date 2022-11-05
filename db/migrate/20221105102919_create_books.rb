class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :category
      t.text :description
      t.datetime :published_date
      t.text :image_url
      t.timestamps
      t.integer :author_id
    end
  end
end
