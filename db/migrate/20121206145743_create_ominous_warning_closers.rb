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
