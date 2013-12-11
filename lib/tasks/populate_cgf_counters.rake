namespace :db do
  desc 'Load CGF sample entries in database'
  task :load_cgf_counters => :environment do
    require 'securerandom'

    def random_count
      rand(1..1000)
    end

    def random_filename
      "#{SecureRandom.hex}.gz"
    end
  
    # Delete data
    CgfCounter.delete_all

    #start_date = Date.today.beginning_of_year
    start_date = Date.today - 70
    end_date = Date.today

    (start_date..end_date).each do |date|
      puts date
      (0..23).each do |hour|
        calltime = DateTime.new(date.year, date.month, date.day, hour)

        (1..rand(5)).each do |record|
          filename = random_filename
          output_count = random_count
          merged_count = random_count
          input_count = output_count + merged_count

          CgfCounter.create!(filename: filename,
                              date_hour: calltime,
                              input: input_count,
                              output: output_count,
                              merged: merged_count)
        end
      end
    end
  end
end
