# == Schema Information
#
# Table name: gcdr_counters
#
#  id             :integer          not null, primary key
#  filename       :string(255)
#  date_and_hour  :datetime
#  input          :integer
#  output         :integer
#  recycled_in    :integer
#  recycled_out   :integer
#  aggregated     :integer
#  malformed_data :integer
#  missing_data   :integer
#  zero_value     :integer
#  min_too_low    :integer
#  prev_processed :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class GcdrCounter < ActiveRecord::Base
  attr_accessible :aggregated, :date_and_hour, :filename, 
    :input, :malformed_data, :min_too_low, :missing_data, 
    :output, :recycled_in, :recycled_out, :zero_value,
    :prev_processed

  def self.by_day(from, to, filename)
    select("date(date_and_hour) as calldate,
            sum(input) as sum_input,
            sum(output) as sum_output,
            sum(recycled_in) as sum_recycled_in,
            sum(recycled_out) as sum_recycled_out,
            sum(aggregated) as sum_aggregated,
            sum(malformed_data) as sum_malformed_data,
            sum(missing_data) as sum_missing_data,
            sum(zero_value) as sum_zero_value,
            sum(prev_processed) as sum_prev_processed,
            sum(min_too_low) as sum_min_too_low")
    .where(date_and_hour: (from..to+1))
    .where("filename like ?", "%#{filename}%")
    .group("date(date_and_hour)")
    .order("date(date_and_hour)")
  end

  def self.by_hour(from, to, filename)
    select("date(date_and_hour) as calldate,
            strftime('%H', date_and_hour) as hour,
            sum(input) as sum_input,
            sum(output) as sum_output,
            sum(recycled_in) as sum_recycled_in,
            sum(recycled_out) as sum_recycled_out,
            sum(aggregated) as sum_aggregated,
            sum(malformed_data) as sum_malformed_data,
            sum(missing_data) as sum_missing_data,
            sum(zero_value) as sum_zero_value,
            sum(prev_processed) as sum_prev_processed,
            sum(min_too_low) as sum_min_too_low")
    .where(date_and_hour: (from..to+1))
    .where("filename like ?", "%#{filename}%")
    .group("date(date_and_hour)", "strftime('%H', date_and_hour)")
    .order("date(date_and_hour)", "strftime('%H', date_and_hour)")
  end

  def self.by_file(from, to, filename)
    select("date(date_and_hour) as calldate,
            strftime('%H', date_and_hour) as hour,
            filename as file,
            sum(input) as sum_input,
            sum(output) as sum_output,
            sum(recycled_in) as sum_recycled_in,
            sum(recycled_out) as sum_recycled_out,
            sum(aggregated) as sum_aggregated,
            sum(malformed_data) as sum_malformed_data,
            sum(missing_data) as sum_missing_data,
            sum(zero_value) as sum_zero_value,
            sum(prev_processed) as sum_prev_processed,
            sum(min_too_low) as sum_min_too_low")
    .where(date_and_hour: (from..to+1))
    .where("filename like ?", "%#{filename}%")
    .group("date(date_and_hour)", "strftime('%H', date_and_hour)", :filename)
    .order("date(date_and_hour)", "strftime('%H', date_and_hour)", :filename)
  end

end
