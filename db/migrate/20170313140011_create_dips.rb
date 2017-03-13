class CreateDips < ActiveRecord::Migration
  def change
    create_table :dips do |t|
      t.string :title
      t.text :description,
      t.timestamps
    end
  end
end
