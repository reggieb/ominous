# This migration comes from ominous (originally 20130131131934)
class AddLinkTextAndMessageToOminousClosers < ActiveRecord::Migration
  def change
    add_column :ominous_closers, :link_text, :string
    add_column :ominous_closers, :message, :text
  end
end
