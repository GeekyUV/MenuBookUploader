class DishesController < ApplicationController
  def index
    @dishes = Dish.all
  end

  def import
    csv_file = params[:file]
    notice_message = "No CSV file was uploaded."

    begin
      if csv_file.present?
        if csv_file.size <= 5.kilobytes
          CsvProcessingWorker.new.perform(csv_file.path)
          notice_message = "CSV file imported successfully!"
        else
          CsvProcessingWorker.perform_async(csv_file.path)
          notice_message = "CSV file import is in progress!"
        end
      end
    rescue CSV::MalformedCSVError => e
      flash[:alert] = "Malformed CSV file: #{e.message}"
    rescue StandardError => e
      flash[:alert] = "An error occurred during import: #{e.message}"
    end

    redirect_to root_url, notice: notice_message
  end

  def show
    @dishes = Dish.all
  end

  def destroy_all
    begin
      Dish.destroy_all
      flash[:notice] = 'All dishes deleted successfully'
    rescue StandardError => e
      flash[:alert] = "An error occurred while deleting dishes: #{e.message}"
    end

    redirect_to dish_path
  end

end
