class CreateOminousClosers < ActiveRecord::Migration
  def change
    create_table :ominous_closers do |t|
      t.column :name, :string
      t.column :url, :string
      t.timestamps
    end
  end
end
