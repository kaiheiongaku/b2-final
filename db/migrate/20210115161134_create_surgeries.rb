class CreateSurgeries < ActiveRecord::Migration[5.2]
  def change
    create_table :surgeries do |t|
      t.string :title
      t.string :day_of_the_week
      t.integer :room_number

      t.timestamps
    end
  end
end
