class ScdrCounter < ActiveRecord::Base
  attr_accessible :aggregated, :cause_for_closing, :date_and_hour, 
    :filename, :input, :malformed_data, :min_too_low, :missing_data, 
    :output, :prev_processed, :recycled_in, :recycled_out, :zero_value
end
