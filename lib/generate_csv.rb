module Sinatra
  module GenerateCsv
    def generate_csv
      CSV.open('receipts.csv', 'wb', row_sep: "\r\n") do |csv|
        csv << ['Date'] + Receipt::RECEIPT_TYPES

        Receipt.all.each do |receipt|
          csv << receipt.as_csv
        end

        last_row = ['Total']
        Receipt::RECEIPT_TYPES.each_with_index do |receipt_type, index|
          last_row[index+1] = Receipt.get_total_for(receipt_type)
        end

        csv << last_row
      end
    end
  end

  helpers GenerateCsv
end
