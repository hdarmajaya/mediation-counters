class CreateCgfCounters < ActiveRecord::Migration
  def change
    create_table :cgf_counters do |t|
      t.string :filename
      t.datetime :date_hour
      t.integer :input
      t.integer :output
      t.integer :merged

      t.timestamps
    end
  end
end
