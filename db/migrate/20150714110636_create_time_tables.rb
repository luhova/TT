class CreateTimeTables < ActiveRecord::Migration
  def change
    create_table :time_tables do |t|
      t.string :from
      t.string :to
      t.datetime :time
      t.string :sort

      t.timestamps
    end
  end
end
