class CreateSurveyUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :survey_users do |t|
      t.references :user_survey, null: false, foreign_key: true
      t.references :survey, null: false, foreign_key: true

      t.timestamps
    end
  end
end
