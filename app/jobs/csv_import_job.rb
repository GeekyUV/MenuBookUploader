require 'csv'

class CsvImportJob < ApplicationJob
  queue_as :default

  def perform(csv_file)
    CSV.foreach(file_path, headers: true).in_batches(of: 1000) do |batch|
      Dish.transaction do
        batch.each do |row|
          dish_hash = row.to_hash
          dish = Dish.find_or_initialize_by(dish_name: dish_hash['dish_name'])
          dish.update(dish_hash)
        end
      end
    end
  end
end
