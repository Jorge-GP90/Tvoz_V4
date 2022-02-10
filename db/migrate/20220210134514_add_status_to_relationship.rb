class AddStatusToRelationship < ActiveRecord::Migration[6.0]
  def change
    add_column :relationships, :status, :boolean, default: false
  end
end
