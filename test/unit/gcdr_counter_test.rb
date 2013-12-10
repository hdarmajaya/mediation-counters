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

require 'test_helper'

class GcdrCounterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
