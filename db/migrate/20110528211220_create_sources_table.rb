class CreateSourcesTable < ActiveRecord::Migration
  def self.up
    create_table :sources do |t|
      t.string :name
      t.string :homepage_url
      t.string :rss_url
      t.references :source_category
      t.string :item_link_field
      t.string :item_title_field
      t.string :item_description_field

      t.timestamps
    end
    add_index :sources, :id
  end

  def self.down
    drop_table :sources
  end
end
