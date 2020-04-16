class CreateTagSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_surveys do |t|
      t.references :survey, null: false, foreign_key: true
      t.references :tag, null: true, foreign_key: true
      t.timestamps
    end
  end
end
