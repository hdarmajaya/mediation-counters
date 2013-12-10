module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Mediation Counters"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def get_hourly_count_by_date(date)
    a = Array.new

    @hourly_counters.each do |hc|
      if Date.parse(hc.calldate) == Date.parse(date)
        a << hc.clone
      end
    end

    return a
  end

  def get_hourly_count_by_file(date)
    a = Array.new

    @file_counters.each do |fc|
      if Date.parse(fc.calldate) == Date.parse(date)
        a << fc.clone
      end
    end

    return a
  end

  def display_date(date)
    return Date.parse(date).strftime('%a, %d %b %Y')
  end

end
