class ConditionsImporter

  def initialize(filename=File.dirname(__FILE__) + "/../db/data/conditions.csv")
    @filename = filename
  end

  def import
    field_names = ['name', 'description', 'source', 'url']

    print "Importing conditions from #{@filename}: "
    failure_count = 0

    Condition.transaction do
      File.open(@filename).each do |line|
        data = line.chomp.split(',')
        attribute_hash = Hash[field_names.zip(data)]
        begin
          condition = Condition.create!(attribute_hash)
          print "."; STDOUT.flush
        rescue ActiveRecord::UnknownAttributeError
          print "!"; STDOUT.flush
          failure_count += 1
        end
      end
    end
    failures = "(failed to create #{failure_count} condition records)" if failure_count > 0
    puts "\nDONE #{failures}\n\n"
  end

end