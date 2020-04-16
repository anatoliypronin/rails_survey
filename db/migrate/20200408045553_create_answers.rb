class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.belongs_to :question, null: false
      t.belongs_to :variant
      t.string :title
      t.integer :variant_id
      t.string :type, null: false
      t.timestamps
    end
  end
end
