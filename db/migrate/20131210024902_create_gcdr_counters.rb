class CreateGcdrCounters < ActiveRecord::Migration
  def change
    create_table :gcdr_counters do |t|
      t.string :filename
      t.datetime :date_and_hour
      t.integer :input
      t.integer :output
      t.integer :recycled_in
      t.integer :recycled_out
      t.integer :aggregated
      t.integer :malformed_data
      t.integer :missing_data
      t.integer :zero_value
      t.integer :min_too_low

      t.timestamps
    end
  end
end
