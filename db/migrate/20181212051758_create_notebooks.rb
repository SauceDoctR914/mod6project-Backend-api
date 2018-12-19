class CreateNotebooks < ActiveRecord::Migration[5.2]
  def change
    create_table :notebooks do |t|
      t.string :title
      t.references :user
      t.timestamps
    end
  end
end
