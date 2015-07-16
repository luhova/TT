class CreateTimeTables < ActiveRecord::Migration
  def change
    create_table :time_tables do |t|
      t.string :from
      t.string :to
      t.time :time
      t.string :transport

      t.timestamps
    end
  end
end
