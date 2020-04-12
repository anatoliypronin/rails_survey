class ChangeFirstNameLastNameStateNullOnUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:users, :first_name, false)
    change_column_null(:users, :last_name, false)
    change_column_null(:users, :state, false)
    change_column_null(:users, :type, false)
  end
end
