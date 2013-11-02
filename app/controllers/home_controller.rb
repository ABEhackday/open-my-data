class HomeController < ApplicationController
  def index
    @dataset_count = Dataset.all.size
  end
end
