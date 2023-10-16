class CreateConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :conditions do |t|
        t.string     :title        , null: false
        t.text       :text         , null: false
        t.integer    :usage_id     , null: false
      t.timestamps
    end
  end
end
