require 'import_helpers'
require 'pry'
require 'open-uri'

class DatasetsController < ApplicationController
  before_action :set_dataset, only: [:show, :edit, :update, :destroy, :summary]
  before_action :authenticate_user!, only: [:new, :create, :update]

  # GET /datasets
  # GET /datasets.json
  def index
    @datasets = Dataset.page(params[:page])
    render layout: nil if request.xhr?
  end

  # GET /datasets/1
  # GET /datasets/1.json
  def show
    respond_to do |format|
      format.html
      format.json do
        set_dataset
        return render json: @dataset.errors, status: :unprocessable_entity if @dataset == nil 
        fields = {}
        @dataset.dataset_fields.each do |f|
          fields[f.id] = f.name
        end
        rows = @dataset.dataset_rows
        result = []
        rows.each do |row_rec|
          row = {}
          row_data = row_rec.dataset_data
          row_data.each do |d|
            field_name = fields[d.dataset_field_id]
            row[field_name] = d.dataset_field_data
          end
          result << row
        end
        render json: result
      end
    end
  end

  def summary
  end

  # GET /datasets/new
  def new
    @dataset = Dataset.new
  end

  # GET /datasets/1/edit
  def edit
  end

  # POST /datasets
  # POST /datasets.json
  def create
    @dataset = Dataset.new(dataset_params)
    @dataset.owner = current_user

    respond_to do |format|
      if @dataset.save
        data = nil
        if params[:dataset][:datafile]
          # Import uploaded file and transform it into Ruby data-strcuture
          data = params[:dataset][:datafile]
          if data.original_filename.end_with? '.csv'
            data = read_csv(data.read)
          elsif data.original_filename.end_with? '.json'
            data = JSON.parse(data.read)
          end
        else
          # binding.pry
          # http://localhost:3000/datasets/1.json
          json_res = `curl #{params[:dataset][:source]}`
          data = JSON.parse(json_res)
        end

        # Create dataset fields 
        fields = []
        fields_rec = []
        data[0].each_key { |k| fields << k }
        fields.each do |field_name|
          field = @dataset.dataset_fields.create(:name=>field_name, :datatype=>0)
          field.save
          fields_rec << field
        end

        # Create dataset data
        data.each do |e|
          row = @dataset.dataset_rows.create
          row.save
          ActiveRecord::Base.transaction do
            fields_rec.each do |rec|
              col = row.dataset_data.create
              col.dataset_field_id = rec.id
              col.dataset_field_data = e[rec.name]
              col.save
            end
          end
        end
        format.html { redirect_to @dataset, notice: 'Dataset was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dataset }
      else
        format.html { render action: 'new' }
        format.json { render json: @dataset.errors, status: :unprocessable_entity }
      end
    end

  end

  # GET /datasets/:id/json
  def json
  end

  # PATCH/PUT /datasets/1
  # PATCH/PUT /datasets/1.json
  def update
    respond_to do |format|
      if @dataset.update(dataset_params)
        format.html { redirect_to @dataset, notice: 'Dataset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dataset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datasets/1
  # DELETE /datasets/1.json
  def destroy
    @dataset.destroy
    respond_to do |format|
      format.html { redirect_to datasets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dataset
      @dataset = Dataset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dataset_params
      params.require(:dataset).permit(:name, :description, :license, :source, :source_type, :sync_frequency, :owner_id)
    end
end
