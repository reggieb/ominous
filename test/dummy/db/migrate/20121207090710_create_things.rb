class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :name
      t.boolean :has_warning
      t.timestamps
    end
  end
end
