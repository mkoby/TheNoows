class AddVotesTable < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.references :user
      t.references :news_item

      t.timestamps
    end
    add_index :votes, :user_id
    add_index :votes, :news_item_id
  end

  def self.down
    drop_table :votes
  end
end

