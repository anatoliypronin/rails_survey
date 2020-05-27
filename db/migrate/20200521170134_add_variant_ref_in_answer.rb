class AddVariantRefInAnswer < ActiveRecord::Migration[6.0]
  def change
    change_table :answers do |t|
      t.references :variant
    end
    remove_index :answers, name: "index_answers_on_variant_id"
  end
end
