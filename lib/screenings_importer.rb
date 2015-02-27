class ScreeningsImporter

  def initialize(filename=File.dirname(__FILE__) + "/../db/data/screenings.csv")
    @filename = filename
  end

  def import
    field_names = ['name', 'condition_id', 'gender', 'min_18_24', 'max_18_24', 
      'min_25_29', 'max_25_29', 'min_30_39', 'max_30_39', 'min_40_49', 'max_40_49',
      'min_50_59', 'max_50_59', 'min_60_69', 'max_60_69', 'min_70_up', 'max_70_up']

    print "Importing screenings from #{@filename}: "
    failure_count = 0

    Screening.transaction do
      File.open(@filename).each do |line|
        data = line.chomp.split(',')
        attribute_hash = Hash[field_names.zip(data)]
        begin
          screenings = Screening.create!(attribute_hash)
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
