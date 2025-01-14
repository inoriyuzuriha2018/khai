class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.integer :is_public, default: 1
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
