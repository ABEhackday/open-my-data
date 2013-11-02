require 'test_helper'

class DatasetParametersControllerTest < ActionController::TestCase
  setup do
    @dataset_parameter = dataset_parameters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dataset_parameters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dataset_parameter" do
    assert_difference('DatasetParameter.count') do
      post :create, dataset_parameter: { placeholder_coverter: @dataset_parameter.placeholder_coverter, placeholder_name: @dataset_parameter.placeholder_name, placeholder_type: @dataset_parameter.placeholder_type, placeholder_valid_values: @dataset_parameter.placeholder_valid_values }
    end

    assert_redirected_to dataset_parameter_path(assigns(:dataset_parameter))
  end

  test "should show dataset_parameter" do
    get :show, id: @dataset_parameter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dataset_parameter
    assert_response :success
  end

  test "should update dataset_parameter" do
    patch :update, id: @dataset_parameter, dataset_parameter: { placeholder_coverter: @dataset_parameter.placeholder_coverter, placeholder_name: @dataset_parameter.placeholder_name, placeholder_type: @dataset_parameter.placeholder_type, placeholder_valid_values: @dataset_parameter.placeholder_valid_values }
    assert_redirected_to dataset_parameter_path(assigns(:dataset_parameter))
  end

  test "should destroy dataset_parameter" do
    assert_difference('DatasetParameter.count', -1) do
      delete :destroy, id: @dataset_parameter
    end

    assert_redirected_to dataset_parameters_path
  end
end
