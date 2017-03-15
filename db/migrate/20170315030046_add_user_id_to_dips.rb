class AddUserIdToDips < ActiveRecord::Migration
  def change
    add_column :dips, :user_id, :integer
  end
end
