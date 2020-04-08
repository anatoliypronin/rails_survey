class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :title
      t.integer :variant_id
      t.string :type

      t.timestamps
    end
  end
end
