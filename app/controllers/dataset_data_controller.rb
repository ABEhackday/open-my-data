class DatasetDataController < ApplicationController
  before_action :set_dataset_datum, only: [:show, :edit, :update, :destroy]

  # GET /dataset_data
  # GET /dataset_data.json
  def index
    @dataset_data = DatasetDatum.all
  end

  # GET /dataset_data/1
  # GET /dataset_data/1.json
  def show
  end

  # GET /dataset_data/new
  def new
    @dataset_datum = DatasetDatum.new
  end

  # GET /dataset_data/1/edit
  def edit
  end

  # POST /dataset_data
  # POST /dataset_data.json
  def create
    @dataset_datum = DatasetDatum.new(dataset_datum_params)

    respond_to do |format|
      if @dataset_datum.save
        format.html { redirect_to @dataset_datum, notice: 'Dataset datum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dataset_datum }
      else
        format.html { render action: 'new' }
        format.json { render json: @dataset_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dataset_data/1
  # PATCH/PUT /dataset_data/1.json
  def update
    respond_to do |format|
      if @dataset_datum.update(dataset_datum_params)
        format.html { redirect_to @dataset_datum, notice: 'Dataset datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dataset_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dataset_data/1
  # DELETE /dataset_data/1.json
  def destroy
    @dataset_datum.destroy
    respond_to do |format|
      format.html { redirect_to dataset_data_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dataset_datum
      @dataset_datum = DatasetDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dataset_datum_params
      params.require(:dataset_datum).permit(:dataset_field_id_id, :dataset_row_id_id, :dataset_field_data)
    end
end
