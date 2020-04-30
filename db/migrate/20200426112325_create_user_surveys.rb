class CreateUserSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :user_surveys do |t|
      t.references :user, null: false, foreign_key: true
      t.string :state

      t.timestamps
    end
  end
end
