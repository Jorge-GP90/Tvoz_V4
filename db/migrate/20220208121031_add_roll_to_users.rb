class AddRollToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role, :integer, :default => 0
    #Ex:- :default =>''
  end
end
