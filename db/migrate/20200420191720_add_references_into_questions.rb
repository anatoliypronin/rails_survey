class AddReferencesIntoQuestions < ActiveRecord::Migration[6.0]
  def change
    change_table :questions do |t|
      t.references :survey, null: false, foreign_key: true
    end
  end
end
