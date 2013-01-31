# This migration comes from ominous (originally 20121206153254)
class CreateOminousClosers < ActiveRecord::Migration
  def change
    create_table :ominous_closers do |t|
      t.column :name, :string
      t.column :url, :string
      t.column :closure_method, :string, :limit => 30
      t.column :start_hidden, :boolean, :default => false
      t.timestamps
    end
  end
end
