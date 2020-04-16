class ChangeTitleNullOnSurveys < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:surveys, :title, false)
  end
end
