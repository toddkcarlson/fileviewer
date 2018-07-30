require 'test_helper'

class KmlsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kmls_index_url
    assert_response :success
  end

  test "should get new" do
    get kmls_new_url
    assert_response :success
  end

  test "should get create" do
    get kmls_create_url
    assert_response :success
  end

  test "should get destroy" do
    get kmls_destroy_url
    assert_response :success
  end

end
