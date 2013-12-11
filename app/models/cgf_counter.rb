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

class CgfCounter < ActiveRecord::Base
  attr_accessible :date_hour, :filename, :input, :merged, :output

  def self.terms_for(file)
    suggestions = where("filename like ?", "%#{file}%")
    suggestions.order("filename desc").limit(10).pluck(:filename)
  end

  def self.get_date(file)
    where(filename: file).limit(1).pluck(:date_hour)
  end

  def self.by_day(from, to, filename)
    select("date(date_hour) as calldate,
            sum(input) as sum_input,
            sum(output) as sum_output,
            sum(merged) as sum_merged")
    .where(date_hour: (from..to+1))
    .where("filename like ?", "%#{filename}%")
    .group("date(date_hour)")
    .order("date(date_hour)")
  end

  def self.by_hour(from, to, filename)
    select("date(date_hour) as calldate,
            strftime('%H', date_hour) as hour,
            sum(input) as sum_input,
            sum(output) as sum_output,
            sum(merged) as sum_merged")
    .where(date_hour: (from..to+1))
    .where("filename like ?", "%#{filename}%")
    .group("date(date_hour)", "strftime('%H', date_hour)")
    .order("date(date_hour)", "strftime('%H', date_hour)")
  end

  def self.by_file(from, to, filename)
    select("date(date_hour) as calldate,
            strftime('%H', date_hour) as hour,
            filename as file,
            sum(input) as sum_input,
            sum(output) as sum_output,
            sum(merged) as sum_merged")
    .where(date_hour: (from..to+1))
    .where("filename like ?", "%#{filename}%")
    .group("date(date_hour)", "strftime('%H', date_hour)", :filename)
    .order("date(date_hour)", "strftime('%H', date_hour)", :filename)
  end

end
