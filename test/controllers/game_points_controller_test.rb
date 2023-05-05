require "test_helper"

class GamePointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_point = game_points(:one)
  end

  test "should get index" do
    get game_points_url
    assert_response :success
  end

  test "should get new" do
    get new_game_point_url
    assert_response :success
  end

  test "should create game_point" do
    assert_difference("GamePoint.count") do
      post game_points_url, params: { game_point: { img: @game_point.img, link: @game_point.link, title: @game_point.title } }
    end

    assert_redirected_to game_point_url(GamePoint.last)
  end

  test "should show game_point" do
    get game_point_url(@game_point)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_point_url(@game_point)
    assert_response :success
  end

  test "should update game_point" do
    patch game_point_url(@game_point), params: { game_point: { img: @game_point.img, link: @game_point.link, title: @game_point.title } }
    assert_redirected_to game_point_url(@game_point)
  end

  test "should destroy game_point" do
    assert_difference("GamePoint.count", -1) do
      delete game_point_url(@game_point)
    end

    assert_redirected_to game_points_url
  end
end
