class CreateUserTags < ActiveRecord::Migration[6.0]
  def change
    create_table :user_tags do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tag, null: true, foreign_key: true
      t.timestamps
    end
    add_index :user_surveys, %i[user_id tag_id], unique: true
  end
end
