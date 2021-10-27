require "test_helper"

class InfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @info = infos(:one)
  end

  test "should get index" do
    get infos_url, as: :json
    assert_response :success
  end

  test "should create info" do
    assert_difference('Info.count') do
      post infos_url, params: { info: { most_ip: @info.most_ip, most_resource: @info.most_resource, request_types: @info.request_types, unique_users: @info.unique_users } }, as: :json
    end

    assert_response 201
  end

  test "should show info" do
    get info_url(@info), as: :json
    assert_response :success
  end

  test "should update info" do
    patch info_url(@info), params: { info: { most_ip: @info.most_ip, most_resource: @info.most_resource, request_types: @info.request_types, unique_users: @info.unique_users } }, as: :json
    assert_response 200
  end

  test "should destroy info" do
    assert_difference('Info.count', -1) do
      delete info_url(@info), as: :json
    end

    assert_response 204
  end
end
