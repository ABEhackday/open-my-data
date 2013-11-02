require 'test_helper'

class DatasetDataControllerTest < ActionController::TestCase
  setup do
    @dataset_datum = dataset_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dataset_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dataset_datum" do
    assert_difference('DatasetDatum.count') do
      post :create, dataset_datum: { dataset_field_data: @dataset_datum.dataset_field_data, dataset_field_id_id: @dataset_datum.dataset_field_id_id, dataset_row_id_id: @dataset_datum.dataset_row_id_id }
    end

    assert_redirected_to dataset_datum_path(assigns(:dataset_datum))
  end

  test "should show dataset_datum" do
    get :show, id: @dataset_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dataset_datum
    assert_response :success
  end

  test "should update dataset_datum" do
    patch :update, id: @dataset_datum, dataset_datum: { dataset_field_data: @dataset_datum.dataset_field_data, dataset_field_id_id: @dataset_datum.dataset_field_id_id, dataset_row_id_id: @dataset_datum.dataset_row_id_id }
    assert_redirected_to dataset_datum_path(assigns(:dataset_datum))
  end

  test "should destroy dataset_datum" do
    assert_difference('DatasetDatum.count', -1) do
      delete :destroy, id: @dataset_datum
    end

    assert_redirected_to dataset_data_path
  end
end
