require "application_system_test_case"

class RewardsTest < ApplicationSystemTestCase
  setup do
    @reward = rewards(:one)
  end

  test "visiting the index" do
    visit rewards_url
    assert_selector "h1", text: "Rewards"
  end

  test "should create reward" do
    visit rewards_url
    click_on "New reward"

    fill_in "Coin value", with: @reward.coin_value
    fill_in "Payout amount", with: @reward.payout_amount
    fill_in "Payout logo", with: @reward.payout_logo
    fill_in "Payout name", with: @reward.payout_name
    fill_in "Payout type", with: @reward.payout_type
    click_on "Create Reward"

    assert_text "Reward was successfully created"
    click_on "Back"
  end

  test "should update Reward" do
    visit reward_url(@reward)
    click_on "Edit this reward", match: :first

    fill_in "Coin value", with: @reward.coin_value
    fill_in "Payout amount", with: @reward.payout_amount
    fill_in "Payout logo", with: @reward.payout_logo
    fill_in "Payout name", with: @reward.payout_name
    fill_in "Payout type", with: @reward.payout_type
    click_on "Update Reward"

    assert_text "Reward was successfully updated"
    click_on "Back"
  end

  test "should destroy Reward" do
    visit reward_url(@reward)
    click_on "Destroy this reward", match: :first

    assert_text "Reward was successfully destroyed"
  end
end
