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
end
