class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :title, null: false
      t.string :text
      t.text :image, null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
