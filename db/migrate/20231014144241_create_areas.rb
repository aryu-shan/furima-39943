class CreateAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :areas do |t|
      t.string     :title,         null: false
      t.text       :text,          null: false
      t.integer    :prefecture_id, null: false
      t.timestamps
    end
  end
end
