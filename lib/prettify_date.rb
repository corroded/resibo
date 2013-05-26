module Sinatra
  module PrettifyDate
    def prettify_date(date)
      date.strftime '%m/%d/%Y' unless date.nil?
    end
  end

  helpers PrettifyDate
end
