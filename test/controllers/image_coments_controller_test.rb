require 'test_helper'

class ImageComentsControllerTest < ActionController::TestCase
  setup do
    @image_coment = image_coments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:image_coments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image_coment" do
    assert_difference('ImageComent.count') do
      post :create, image_coment: { comment: @image_coment.comment, image_id: @image_coment.image_id, user_id: @image_coment.user_id }
    end

    assert_redirected_to image_coment_path(assigns(:image_coment))
  end

  test "should show image_coment" do
    get :show, id: @image_coment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image_coment
    assert_response :success
  end

  test "should update image_coment" do
    patch :update, id: @image_coment, image_coment: { comment: @image_coment.comment, image_id: @image_coment.image_id, user_id: @image_coment.user_id }
    assert_redirected_to image_coment_path(assigns(:image_coment))
  end

  test "should destroy image_coment" do
    assert_difference('ImageComent.count', -1) do
      delete :destroy, id: @image_coment
    end

    assert_redirected_to image_coments_path
  end
end
