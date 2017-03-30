class RestoreNotDefaultUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :twitter, nil
    change_column_default :users, :apellido, nil
  end
end
