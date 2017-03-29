class AddDefaultValueToTwitterAttribute < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :twitter, ""
    change_column_default :users, :apellido, ""
  end
end
