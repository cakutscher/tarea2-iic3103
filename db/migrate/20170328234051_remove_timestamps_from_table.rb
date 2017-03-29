class RemoveTimestampsFromTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :created_at, :string
    remove_column :users, :updated_at, :string
  end
end
