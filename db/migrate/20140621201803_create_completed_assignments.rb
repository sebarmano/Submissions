class CreateCompletedAssignments < ActiveRecord::Migration
  def change
    create_table :completed_assignments do |t|
      t.references :user, index: true
      t.references :assignments, index: true
      t.string :url
      t.boolean :completed

      t.timestamps
    end
  end
end
