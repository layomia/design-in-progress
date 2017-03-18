class DropDipsUsersTable < ActiveRecord::Migration
  def up
    drop_table :dips_users
  end
end
