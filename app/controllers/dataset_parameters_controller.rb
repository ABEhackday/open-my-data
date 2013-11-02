class DatasetParametersController < ApplicationController
  before_action :set_dataset_parameter, only: [:show, :edit, :update, :destroy]

  # GET /dataset_parameters
  # GET /dataset_parameters.json
  def index
    @dataset_parameters = DatasetParameter.all
  end

  # GET /dataset_parameters/1
  # GET /dataset_parameters/1.json
  def show
  end

  # GET /dataset_parameters/new
  def new
    @dataset_parameter = DatasetParameter.new
  end

  # GET /dataset_parameters/1/edit
  def edit
  end

  # POST /dataset_parameters
  # POST /dataset_parameters.json
  def create
    @dataset_parameter = DatasetParameter.new(dataset_parameter_params)

    respond_to do |format|
      if @dataset_parameter.save
        format.html { redirect_to @dataset_parameter, notice: 'Dataset parameter was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dataset_parameter }
      else
        format.html { render action: 'new' }
        format.json { render json: @dataset_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dataset_parameters/1
  # PATCH/PUT /dataset_parameters/1.json
  def update
    respond_to do |format|
      if @dataset_parameter.update(dataset_parameter_params)
        format.html { redirect_to @dataset_parameter, notice: 'Dataset parameter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dataset_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dataset_parameters/1
  # DELETE /dataset_parameters/1.json
  def destroy
    @dataset_parameter.destroy
    respond_to do |format|
      format.html { redirect_to dataset_parameters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dataset_parameter
      @dataset_parameter = DatasetParameter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dataset_parameter_params
      params.require(:dataset_parameter).permit(:placeholder_name, :placeholder_type, :placeholder_coverter, :placeholder_valid_values)
    end
end
