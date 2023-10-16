class CreateHandlingTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :handling_times do |t|
      t.string     :title,        null: false
      t.text       :text ,        null: false
      t.integer    :schedule_id,  null: false
      t.timestamps
    end
  end
end
