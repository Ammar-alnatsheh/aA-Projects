class ShortenedUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :shortenedurls do |t|
      t.integer :user_id, null: false 
      t.string :short_url, null: false 
      t.string :long_url, null: false 
      t.timestamps
    end
    add_index(:shortenedurls, :short_url , {unique: true})
  end
end
