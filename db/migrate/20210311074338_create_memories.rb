class CreateMemories < ActiveRecord::Migration[6.0]
  def change
    create_table :memories do |t|
      t.string     :title,       null: false
      t.text       :content
      t.date       :memory_date, null: false
      t.references :user,        foreign_key: true
      t.timestamps
    end
  end
end
