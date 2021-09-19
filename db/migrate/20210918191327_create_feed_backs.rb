class CreateFeedBacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feed_backs do |t|
      t.string :feed_back_id, limit: 1000
      t.string :username
      t.string :user_image, limit: 1000
      t.text :content
      t.integer :score
      t.integer :thumbs_up_count
      t.string :review_created_version
      t.datetime :at
      t.text :reply_content
      t.datetime :reply_at
      t.timestamps
    end
  end
end
