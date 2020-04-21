class CreateVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :variants do |t|
      t.references :question, null: false, foreign_key: true
      t.string :title, null: false
      t.timestamps
    end
  end
end
