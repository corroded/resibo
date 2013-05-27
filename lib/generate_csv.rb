module Sinatra
  module GenerateCsv
    def generate_csv
      CSV.open('test.csv', 'wb', row_sep: "\r\n") do |csv|
        csv << ['Date', 'Meals', 'Business Development', 'Parking/Toll','Taxi/Bus','Gas/Fuel','Computer Accessories','Books and Periodicals','Medical','Others']

        Receipt.all.each do |receipt|
          csv << receipt.as_csv
        end
      end
    end
  end

  helpers GenerateCsv
end
