require 'csv'
require 'roo'

class Dish < ApplicationRecord
  def self.import(file_extension, file_path)
    if file_extension == '.csv'
      import_csv(file_path)
    elsif file_extension == '.xlsx'
      import_xlsx(file_path)
    else
      raise "Unsupported file format: #{file_extension}"
    end
  end

  private

  def self.import_csv(file_path)
    CSV.foreach(file_path, headers: true) do |row|
      dish_hash = row.to_hash
      dish = Dish.find_or_initialize_by(dish_name: dish_hash['dish_name'])
      dish.update(dish_hash)
    end
  end

  def self.import_xlsx(file_path)
    xlsx = Roo::Spreadsheet.open(file_path)
    xlsx.default_sheet = xlsx.sheets.first

    header = xlsx.row(1)
    xlsx.each_with_index do |row, index|
      next if index == 0

      dish_hash = Hash[header.zip(row)]
      dish = Dish.find_or_initialize_by(dish_name: dish_hash['dish_name'])
      dish.update(dish_hash)
    end
  end
end
