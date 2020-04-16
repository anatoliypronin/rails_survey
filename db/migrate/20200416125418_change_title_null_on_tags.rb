class ChangeTitleNullOnTags < ActiveRecord::Migration[6.0]
  def change
    def change
      change_column_null(:tags, :title, false)
    end
  end
end
