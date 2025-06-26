class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.references :project, null: false, foreign_key: true
      t.string :user_name
      t.text :body

      t.timestamps
    end
  end
end
