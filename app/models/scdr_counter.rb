# == Schema Information
#
# Table name: scdr_counters
#
#  id                :integer          not null, primary key
#  filename          :string(255)
#  date_and_hour     :datetime
#  input             :integer
#  output            :integer
#  recycled_in       :integer
#  recycled_out      :integer
#  aggregated        :integer
#  malformed_data    :integer
#  missing_data      :integer
#  zero_value        :integer
#  min_too_low       :integer
#  cause_for_closing :integer
#  prev_processed    :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class ScdrCounter < ActiveRecord::Base
  attr_accessible :aggregated, :cause_for_closing, :date_and_hour, 
    :filename, :input, :malformed_data, :min_too_low, :missing_data, 
    :output, :prev_processed, :recycled_in, :recycled_out, :zero_value

  def self.terms_for(file)
    suggestions = where("filename like ?", "%#{file}%")
    suggestions.order("filename desc").limit(10).pluck(:filename)
  end

  def self.get_date(file)
    ScdrCounter.where(filename: file).limit(1).pluck(:date_and_hour)
  end

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
            sum(cause_for_closing) as sum_cause_for_closing,
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
            sum(cause_for_closing) as sum_cause_for_closing,
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
            sum(cause_for_closing) as sum_cause_for_closing,
            sum(min_too_low) as sum_min_too_low")
    .where(date_and_hour: (from..to+1))
    .where("filename like ?", "%#{filename}%")
    .group("date(date_and_hour)", "strftime('%H', date_and_hour)", :filename)
    .order("date(date_and_hour)", "strftime('%H', date_and_hour)", :filename)
  end

end
