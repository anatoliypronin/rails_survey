class AddVariantRefInAnswer < ActiveRecord::Migration[6.0]
  def change
    change_table :answers do |t|
      t.references :variant, foreign_key: true
    end
  end
end
