require 'test_helper'

class DatasetFieldsControllerTest < ActionController::TestCase
  setup do
    @dataset_field = dataset_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dataset_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dataset_field" do
    assert_difference('DatasetField.count') do
      post :create, dataset_field: { dataset_id_id: @dataset_field.dataset_id_id, datatype: @dataset_field.datatype, name: @dataset_field.name }
    end

    assert_redirected_to dataset_field_path(assigns(:dataset_field))
  end

  test "should show dataset_field" do
    get :show, id: @dataset_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dataset_field
    assert_response :success
  end

  test "should update dataset_field" do
    patch :update, id: @dataset_field, dataset_field: { dataset_id_id: @dataset_field.dataset_id_id, datatype: @dataset_field.datatype, name: @dataset_field.name }
    assert_redirected_to dataset_field_path(assigns(:dataset_field))
  end

  test "should destroy dataset_field" do
    assert_difference('DatasetField.count', -1) do
      delete :destroy, id: @dataset_field
    end

    assert_redirected_to dataset_fields_path
  end
end
