require 'test_helper'

class InstapostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instapost = instaposts(:one)
  end

  test "should get index" do
    get instaposts_url
    assert_response :success
  end

  test "should get new" do
    get new_instapost_url
    assert_response :success
  end

  test "should create instapost" do
    assert_difference('Instapost.count') do
      post instaposts_url, params: { instapost: { caption: @instapost.caption, user_id: @instapost.user_id } }
    end

    assert_redirected_to instapost_url(Instapost.last)
  end

  test "should show instapost" do
    get instapost_url(@instapost)
    assert_response :success
  end

  test "should get edit" do
    get edit_instapost_url(@instapost)
    assert_response :success
  end

  test "should update instapost" do
    patch instapost_url(@instapost), params: { instapost: { caption: @instapost.caption, user_id: @instapost.user_id } }
    assert_redirected_to instapost_url(@instapost)
  end

  test "should destroy instapost" do
    assert_difference('Instapost.count', -1) do
      delete instapost_url(@instapost)
    end

    assert_redirected_to instaposts_url
  end
end
