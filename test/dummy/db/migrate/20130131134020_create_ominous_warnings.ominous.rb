# This migration comes from ominous (originally 20121206144249)
class CreateOminousWarnings < ActiveRecord::Migration
  def change
    create_table :ominous_warnings do |t|
      t.column :name, :string
      t.timestamps
    end
  end
end
