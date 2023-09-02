require 'csv'

class Dish < ApplicationRecord
  def self.import(file)
    begin
      CSV.foreach(file.path, headers: true).in_batches(of: 1000) do |batch|
        Dish.transaction do
          batch.each do |row|
            dish_hash = row.to_hash
            dish = Dish.find_or_initialize_by(dish_name: dish_hash['dish_name'])

            dish.update(dish_hash)

            if dish.errors.any?
              errors = dish.errors.full_messages.join(', ')
              raise "Error importing data: #{errors}"
            end

          end
        end
      end
    rescue CSV::MalformedCSVError => e
      raise "Malformed CSV file: #{e.message}"
    rescue StandardError => e
      raise "An error occurred during import: #{e.message}"
    end
  end
end
