class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commentable_type
      t.integer :commentable_id
      t.integer :user_id
      t.text :body
      t.decimal :relX
      t.decimal :relY
      t.timestamps
    end
  end
end
