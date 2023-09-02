class DishesController < ApplicationController
    def index
        @dishes = Dish.all
      end
    
      def import
        csv_file = params[:file]
        notice_message = "No CSV file was uploaded." # Default message
    
        if csv_file.present?
          if csv_file.size <= 5.kilobytes
            CsvProcessingWorker.new.perform(csv_file.path)
            notice_message = "CSV file imported successfully!"
          else
            CsvProcessingWorker.perform_async(csv_file.path)
            notice_message = "CSV file import is in progress!"
          end
        end
    
        redirect_to root_url, notice: notice_message
      end
    
      def show
        @dishes = Dish.all
      end
    
      def destroy_all
        Dish.destroy_all
        redirect_to dish_path, notice: 'All dishes deleted successfully'
      end
    
    
end
