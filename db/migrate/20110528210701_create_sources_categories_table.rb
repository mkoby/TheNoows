class CreateSourcesCategoriesTable < ActiveRecord::Migration
  def self.up
    create_table :source_categories do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :source_categories, :id
  end

  def self.down
    drop_table :source_categories
  end
end
