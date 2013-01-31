class AddLinkTextAndMessageToOminousClosers < ActiveRecord::Migration
  def change
    add_column :ominous_closers, :link_text, :string
    add_column :ominous_closers, :message, :text
  end
end
