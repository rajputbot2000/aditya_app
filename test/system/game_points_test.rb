require "application_system_test_case"

class GamePointsTest < ApplicationSystemTestCase
  setup do
    @game_point = game_points(:one)
  end

  test "visiting the index" do
    visit game_points_url
    assert_selector "h1", text: "Game points"
  end

  test "should create game point" do
    visit game_points_url
    click_on "New game point"

    fill_in "Img", with: @game_point.img
    fill_in "Link", with: @game_point.link
    fill_in "Title", with: @game_point.title
    click_on "Create Game point"

    assert_text "Game point was successfully created"
    click_on "Back"
  end

  test "should update Game point" do
    visit game_point_url(@game_point)
    click_on "Edit this game point", match: :first

    fill_in "Img", with: @game_point.img
    fill_in "Link", with: @game_point.link
    fill_in "Title", with: @game_point.title
    click_on "Update Game point"

    assert_text "Game point was successfully updated"
    click_on "Back"
  end

  test "should destroy Game point" do
    visit game_point_url(@game_point)
    click_on "Destroy this game point", match: :first

    assert_text "Game point was successfully destroyed"
  end
end
