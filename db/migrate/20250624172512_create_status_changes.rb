class CreateStatusChanges < ActiveRecord::Migration[8.0]
  def change
    create_table :status_changes do |t|
      t.references :project, null: false, foreign_key: true
      t.string :user_name
      t.string :status

      t.timestamps
    end
  end
end
