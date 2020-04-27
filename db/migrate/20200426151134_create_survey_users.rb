class CreateSurveyUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :survey_users do |t|
      t.references :user_survey, null: false, foreign_key: true
      t.references :survey, null: false, foreign_key: true
      t.timestamps
    end
  add_index :user_tags, %i[user_survey_id survey_id], unique: true
  end
end
