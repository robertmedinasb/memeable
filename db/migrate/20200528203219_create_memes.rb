class CreateMemes < ActiveRecord::Migration[6.0]
  def change
    create_table :memes do |t|
      t.string :title
      t.string :type
      t.string :url_source
      t.integer :votes_count, default: 0
      t.integer :comments_count, default: 0
      t.references :category, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: { to_table: 'users' }
      t.timestamps
    end
  end
end
