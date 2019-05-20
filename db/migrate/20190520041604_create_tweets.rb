class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :user
      t.string :tweet_content

      t.timestamps
    end
  end
end
