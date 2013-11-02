class DatasetRowsController < ApplicationController
  before_action :set_dataset_row, only: [:show, :edit, :update, :destroy]

  # GET /dataset_rows
  # GET /dataset_rows.json
  def index
    @dataset_rows = DatasetRow.all
  end

  # GET /dataset_rows/1
  # GET /dataset_rows/1.json
  def show
  end

  # GET /dataset_rows/new
  def new
    @dataset_row = DatasetRow.new
  end

  # GET /dataset_rows/1/edit
  def edit
  end

  # POST /dataset_rows
  # POST /dataset_rows.json
  def create
    @dataset_row = DatasetRow.new(dataset_row_params)

    respond_to do |format|
      if @dataset_row.save
        format.html { redirect_to @dataset_row, notice: 'Dataset row was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dataset_row }
      else
        format.html { render action: 'new' }
        format.json { render json: @dataset_row.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dataset_rows/1
  # PATCH/PUT /dataset_rows/1.json
  def update
    respond_to do |format|
      if @dataset_row.update(dataset_row_params)
        format.html { redirect_to @dataset_row, notice: 'Dataset row was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dataset_row.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dataset_rows/1
  # DELETE /dataset_rows/1.json
  def destroy
    @dataset_row.destroy
    respond_to do |format|
      format.html { redirect_to dataset_rows_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dataset_row
      @dataset_row = DatasetRow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dataset_row_params
      params.require(:dataset_row).permit(:dataset_id_id)
    end
end
