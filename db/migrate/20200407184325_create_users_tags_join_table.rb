class CreateUsersTagsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :tags do |t|
      t.index :user_id
      t.index :tag_id
    end
  end
end
