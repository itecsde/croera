require 'test_helper'

class ContextualSettingsControllerTest < ActionController::TestCase
  setup do
    @contextual_setting = contextual_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contextual_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contextual_setting" do
    assert_difference('ContextualSetting.count') do
      post :create, contextual_setting: @contextual_setting.attributes
    end

    assert_redirected_to contextual_setting_path(assigns(:contextual_setting))
  end

  test "should show contextual_setting" do
    get :show, id: @contextual_setting.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contextual_setting.to_param
    assert_response :success
  end

  test "should update contextual_setting" do
    put :update, id: @contextual_setting.to_param, contextual_setting: @contextual_setting.attributes
    assert_redirected_to contextual_setting_path(assigns(:contextual_setting))
  end

  test "should destroy contextual_setting" do
    assert_difference('ContextualSetting.count', -1) do
      delete :destroy, id: @contextual_setting.to_param
    end

    assert_redirected_to contextual_settings_path
  end
end
