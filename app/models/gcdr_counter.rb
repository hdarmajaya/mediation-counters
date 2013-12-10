class GcdrCounter < ActiveRecord::Base
  attr_accessible :aggregated, :date_and_hour, :filename, 
    :input, :malformed_data, :min_too_low, :missing_data, 
    :output, :recycled_in, :recycled_out, :zero_value
end
