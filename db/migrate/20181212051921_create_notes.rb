class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :description
      t.text :content
      t.text :created
      t.references :notebook
      t.references :user
      t.timestamps
    end
  end
end
