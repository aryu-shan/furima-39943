class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :name,              null: false
      t.text       :explanation,       null: false
      t.integer    :category_id,       null: false
      t.integer    :condition_id,      null: false
      t.integer    :price,             null: false
      t.references :user,              null: false, foreign_key: true
      t.integer    :fee_burden_id,     null: false
      t.integer    :area_id,           null: false
      t.integer    :handling_time_id,  null: false
      t.timestamps
    end
  end
end
