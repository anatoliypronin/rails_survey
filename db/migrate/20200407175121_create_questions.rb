class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :position
      t.string :question_kind

      t.timestamps
    end
  end
end
