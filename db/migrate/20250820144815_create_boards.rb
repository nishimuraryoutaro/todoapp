class CreateBoards < ActiveRecord::Migration[8.0]
  def change
    create_table :boards do |t|
      t.string :title
      t.text :content
      t.references :user, null: false
      t.timestamps
    end
  end
end
