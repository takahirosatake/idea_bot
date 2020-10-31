class CreateIdeas < ActiveRecord::Migration[6.0]
  def change
    create_table :ideas do |t|
      t.references :category, foreign_key: true, type: :bigint, null:false
      t.text :body, null:false
      t.timestamps
    end
  end
end
