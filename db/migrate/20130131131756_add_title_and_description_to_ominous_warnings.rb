class AddTitleAndDescriptionToOminousWarnings < ActiveRecord::Migration
  def change
    add_column :ominous_warnings, :title, :string
    add_column :ominous_warnings, :description, :text
  end
end
