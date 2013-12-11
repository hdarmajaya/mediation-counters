# == Schema Information
#
# Table name: cgf_counters
#
#  id         :integer          not null, primary key
#  filename   :string(255)
#  date_hour  :datetime
#  input      :integer
#  output     :integer
#  merged     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CgfCounterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
