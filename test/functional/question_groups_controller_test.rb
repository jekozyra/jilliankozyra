require 'test_helper'

class QuestionGroupsControllerTest < ActionController::TestCase
  setup do
    @question_group = question_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:question_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question_group" do
    assert_difference('QuestionGroup.count') do
      post :create, question_group: @question_group.attributes
    end

    assert_redirected_to question_group_path(assigns(:question_group))
  end

  test "should show question_group" do
    get :show, id: @question_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question_group
    assert_response :success
  end

  test "should update question_group" do
    put :update, id: @question_group, question_group: @question_group.attributes
    assert_redirected_to question_group_path(assigns(:question_group))
  end

  test "should destroy question_group" do
    assert_difference('QuestionGroup.count', -1) do
      delete :destroy, id: @question_group
    end

    assert_redirected_to question_groups_path
  end
end
