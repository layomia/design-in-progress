class CreateDipsAndUsers < ActiveRecord::Migration
  def change
    create_table :dips_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :dip, index: true
    end
  end
end
