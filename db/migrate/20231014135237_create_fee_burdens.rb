class CreateFeeBurdens < ActiveRecord::Migration[7.0]
  def change
    create_table :fee_burdens do |t|
        t.string     :title        , null: false
        t.text       :text         , null: false
        t.integer    :postage_id   , null: false
        t.timestamps
    end
  end
end
