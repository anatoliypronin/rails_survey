class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.string :title
      t.boolean :public
      t.references :tag, null: false, foreign_key: true
      t.string :author, null: false
      t.string :state

      t.timestamps
    end
  end
end
