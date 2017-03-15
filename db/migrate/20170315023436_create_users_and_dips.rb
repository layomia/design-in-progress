class CreateUsersAndDips < ActiveRecord::Migration
  def change
    create_table :users_dips, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :dip, index: true
    end
  end
end
