class AddDipIdToStep < ActiveRecord::Migration
  def change
    add_column :steps, :dip_id, :integer
  end
end
