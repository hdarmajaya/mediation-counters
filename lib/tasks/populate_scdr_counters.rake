namespace :db do
  desc 'Load SCDR sample entries in database'
  task :load_scdr_counters => :environment do
    require 'securerandom'

    def random_count
      rand(1..1000)
    end

    def random_filename
      "#{SecureRandom.hex}.gz"
    end

    # Delete data
    ScdrCounter.delete_all

    #start_date = Date.today.beginning_of_year
    start_date = Date.today - 70
    end_date = Date.today

    (start_date..end_date).each do |date|
      puts date
      (0..23).each do |hour|
        calltime = DateTime.new(date.year, date.month, date.day, hour)

        (1..rand(5)).each do |record|
          filename = random_filename
          out_count = random_count
          rin_count = random_count
          rout_count = random_count
          aggr_count = random_count
          mal_count = random_count
          mis_count = random_count
          zero_count = random_count
          min_count = random_count
          prev_count = random_count
          cfc_count = random_count
          in_count = out_count + rin_count + rout_count + aggr_count + mal_count + mis_count + zero_count + min_count + prev_count + cfc_count

          ScdrCounter.create!(filename: filename,
                              date_and_hour: calltime,
                              input: in_count,
                              output: out_count,
                              recycled_in: rin_count,
                              recycled_out: rout_count,
                              aggregated: aggr_count,
                              malformed_data: mal_count,
                              missing_data: mis_count,
                              zero_value: zero_count,
                              min_too_low: min_count,
                              prev_processed: prev_count,
                              cause_for_closing: cfc_count)
        end
      end
    end
  end
end
