class DishesController < ApplicationController
  def index
    @dishes = Dish.all
  end

  def import
    uploaded_file = params[:file]
    notice_message = "No file was uploaded."

    begin
      if uploaded_file.present?
        file_extension = File.extname(uploaded_file.original_filename).downcase

        if file_extension == '.csv' || file_extension == '.xlsx'
          if uploaded_file.size <= 2.megabytes
            Dish.import(file_extension, uploaded_file.path)
            notice_message = "#{file_extension.upcase} file imported successfully!"
          else
            CsvProcessingWorker.perform_async(uploaded_file.path)
            notice_message = "#{file_extension.upcase} file import is in progress!"
          end
        else
          flash[:alert] = "Unsupported file format. Please upload a CSV or XLSX file."
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
