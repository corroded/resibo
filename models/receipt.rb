class Receipt < ActiveRecord::Base

  include Sinatra::PrettifyDate

  RECEIPT_TYPES = ['Meals', 'Business Development', 'Parking/Toll', 'Taxi/Bus', 'Gas/Fuel', 'Computer Accessories', 'Books and Periodicals', 'Medical', 'Others']

  def as_csv
    csv_row = []
    csv_row[0] = prettify_date(self.receipt_date)
    csv_row[RECEIPT_TYPES.index(self.category) + 1] = self.amount

    csv_row
  end
end
