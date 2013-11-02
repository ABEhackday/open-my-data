require 'test_helper'

class DatasetRowsControllerTest < ActionController::TestCase
  setup do
    @dataset_row = dataset_rows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dataset_rows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dataset_row" do
    assert_difference('DatasetRow.count') do
      post :create, dataset_row: { dataset_id_id: @dataset_row.dataset_id_id }
    end

    assert_redirected_to dataset_row_path(assigns(:dataset_row))
  end

  test "should show dataset_row" do
    get :show, id: @dataset_row
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dataset_row
    assert_response :success
  end

  test "should update dataset_row" do
    patch :update, id: @dataset_row, dataset_row: { dataset_id_id: @dataset_row.dataset_id_id }
    assert_redirected_to dataset_row_path(assigns(:dataset_row))
  end

  test "should destroy dataset_row" do
    assert_difference('DatasetRow.count', -1) do
      delete :destroy, id: @dataset_row
    end

    assert_redirected_to dataset_rows_path
  end
end
