# This migration comes from ominous (originally 20121206145743)
class CreateOminousWarningClosers < ActiveRecord::Migration
  def change
    create_table :ominous_warning_closers do |t|
      t.column :warning_id, :integer
      t.column :closer_id, :integer
      t.column :position, :integer
      t.timestamps
    end
  end
end
