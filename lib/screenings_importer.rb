class ScreeningsImporter

  def initialize(filename=File.dirname(__FILE__) + "/../db/data/screenings.csv")
    @filename = filename
  end

  def import
    field_names = ['name', 'condition_id', 'gender', '18_24_min', '18_24_max', 
      '25_29_min', '25_29_max', '30_39_min', '30_39_max', '40_49_min', '40_49_max',
      '50_59_min', '50_59_max', '60_69_min', '60_69_max', '70_min', '70_max', 'notes']

    print "Importing screenings from #{@filename}: "
    failure_count = 0

    Screening.transaction do
      File.open(@filename).each do |line|
        data = line.chomp.split(',')
        attribute_hash = Screening[field_names.zip(data)]
        begin
          student = Screening.create!(attribute_hash)
          print "."; STDOUT.flush
        rescue ActiveRecord::UnknownAttributeError
          print "!"; STDOUT.flush
          failure_count += 1
        end
      end
    end
    failures = "(failed to create #{failure_count} screening records)" if failure_count > 0
    puts "\nDONE #{failures}\n\n"
  end

end
