# frozen_string_literal: true

class ActsAsFavoritorMigration < ActiveRecord::Migration[5.2]
  def self.up
    create_table :favorites, force: true do |t|
      t.references :favoritable, polymorphic: true, null: false
      t.references :favoritor, polymorphic: true, null: false
      t.string :scope, default: ActsAsFavoritor.configuration.default_scope, null: false, index: true
      t.boolean :blocked, default: false, null: false, index: true
      t.timestamps
    end

    add_index :favorites, ['favoritor_id', 'favoritor_type'], name: 'fk_favorites'
    add_index :favorites, ['favoritable_id', 'favoritable_type'], name: 'fk_favoritables'
    
    #favoritor_score only counts active favorites
    add_column :operators, :favoritor_score, :text
    #favoritor_total counts active and removed favorites
    add_column :operators, :favoritor_total, :text
    add_column :strategies, :favoritable_score, :text
    add_column :games, :favoritable_score, :text
    add_column :games, :favoritable_total, :text
    add_column :strategies, :favoritable_total, :text
  end

  def self.down
    drop_table :favorites
  end
end
