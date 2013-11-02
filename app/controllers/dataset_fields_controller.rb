class DatasetFieldsController < ApplicationController
  before_action :set_dataset_field, only: [:show, :edit, :update, :destroy]

  # GET /dataset_fields
  # GET /dataset_fields.json
  def index
    @dataset_fields = DatasetField.all
  end

  # GET /dataset_fields/1
  # GET /dataset_fields/1.json
  def show
  end

  # GET /dataset_fields/new
  def new
    @dataset_field = DatasetField.new
  end

  # GET /dataset_fields/1/edit
  def edit
  end

  # POST /dataset_fields
  # POST /dataset_fields.json
  def create
    @dataset_field = DatasetField.new(dataset_field_params)

    respond_to do |format|
      if @dataset_field.save
        format.html { redirect_to @dataset_field, notice: 'Dataset field was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dataset_field }
      else
        format.html { render action: 'new' }
        format.json { render json: @dataset_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dataset_fields/1
  # PATCH/PUT /dataset_fields/1.json
  def update
    respond_to do |format|
      if @dataset_field.update(dataset_field_params)
        format.html { redirect_to @dataset_field, notice: 'Dataset field was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dataset_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dataset_fields/1
  # DELETE /dataset_fields/1.json
  def destroy
    @dataset_field.destroy
    respond_to do |format|
      format.html { redirect_to dataset_fields_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dataset_field
      @dataset_field = DatasetField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dataset_field_params
      params.require(:dataset_field).permit(:dataset_id_id, :name, :datatype)
    end
end
