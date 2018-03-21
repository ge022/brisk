require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get restaurants" do
    get page_restaurants_url
    assert_response :success
  end

  test "should get blog" do
    get page_blog_url
    assert_response :success
  end

  test "should get calendar" do
    get page_calendar_url
    assert_response :success
  end

  test "should get contact_us" do
    get page_contact_us_url
    assert_response :success
  end

  test "should get login" do
    get page_login_url
    assert_response :success
  end

  test "should get preferences" do
    get page_preferences_url
    assert_response :success
  end

end
