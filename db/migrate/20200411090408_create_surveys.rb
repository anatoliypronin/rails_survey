class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.string :title
      t.boolean :public
      # t.references :tag_surveys , null: true, foreign_key: true
      # t.string :author
      t.string :state

      t.timestamps
    end
  end
end
