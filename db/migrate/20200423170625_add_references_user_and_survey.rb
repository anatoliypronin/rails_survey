class AddReferencesUserAndSurvey < ActiveRecord::Migration[6.0]
  def change
    change_table :surveys do |t|
      t.references :user, null: false, foreign_key: true
    end
  end
end
