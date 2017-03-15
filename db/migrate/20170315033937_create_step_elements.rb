class CreateStepElements < ActiveRecord::Migration
  def change
    create_table :step_elements do |t|
      t.string :name
      t.text :description
      t.integer :step_id
      t.timestamps
    end
  end
end
