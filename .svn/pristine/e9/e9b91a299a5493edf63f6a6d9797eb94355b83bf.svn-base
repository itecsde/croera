require 'test_helper'

class ActivitySequencesControllerTest < ActionController::TestCase
  setup do
    @activity_sequence = activity_sequences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_sequences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_sequence" do
    assert_difference('ActivitySequence.count') do
      post :create, activity_sequence: @activity_sequence.attributes
    end

    assert_redirected_to activity_sequence_path(assigns(:activity_sequence))
  end

  test "should show activity_sequence" do
    get :show, id: @activity_sequence.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity_sequence.to_param
    assert_response :success
  end

  test "should update activity_sequence" do
    put :update, id: @activity_sequence.to_param, activity_sequence: @activity_sequence.attributes
    assert_redirected_to activity_sequence_path(assigns(:activity_sequence))
  end

  test "should destroy activity_sequence" do
    assert_difference('ActivitySequence.count', -1) do
      delete :destroy, id: @activity_sequence.to_param
    end

    assert_redirected_to activity_sequences_path
  end
end
