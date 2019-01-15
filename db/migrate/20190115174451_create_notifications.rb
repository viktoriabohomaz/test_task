class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :description
      t.date :date
      t.time :time
      t.boolean :sended, default: false
      t.references :user

      t.timestamps
    end
  end
end
