class AddIndexToTagIdAndSurveyIdInTagSurveys < ActiveRecord::Migration[6.0]
  def change
    add_index :tag_surveys, [:survey_id, :tag_id], unique: true
  end
end
  
