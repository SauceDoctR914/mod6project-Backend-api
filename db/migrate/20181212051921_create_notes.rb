class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :description
      t.text :content
      t.date :created
      t.references :notebook
      t.timestamps
    end
  end
end
