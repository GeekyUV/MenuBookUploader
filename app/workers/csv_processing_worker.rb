class CsvProcessingWorker
    include Sidekiq::Worker
  
    def perform(file_path)
      CSV.foreach(file_path, headers: true) do |row|
        dish_hash = row.to_hash
        dish = Dish.find_or_initialize_by(dish_name: dish_hash['dish_name'])
        dish.update(dish_hash)
      end
    end
  end
  