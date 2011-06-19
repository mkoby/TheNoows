class CreateNewsItemsTable < ActiveRecord::Migration
  def self.up
    create_table :news_items do |t|
      t.references :source
      t.string :title
      t.string :link
      t.datetime :published_at
      t.integer :total_votes, :default => 0
      t.datetime :last_clicked_at, :default => nil
#      t.string :description
#      t.datetime :frontpage, :default => nil

      t.timestamps
    end
    add_index :news_items, :id
    add_index :news_items, :source_id
  end

  def self.down
    remove_index :news_items, :source_id
    remove_index :news_items, :id
    drop_table :news_items
  end
end

