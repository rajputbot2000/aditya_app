require "application_system_test_case"

class ApplistsTest < ApplicationSystemTestCase
  setup do
    @applist = applists(:one)
  end

  test "visiting the index" do
    visit applists_url
    assert_selector "h1", text: "Applists"
  end

  test "should create applist" do
    visit applists_url
    click_on "New applist"

    fill_in "App link", with: @applist.app_link
    fill_in "Bonus", with: @applist.bonus
    fill_in "Logo", with: @applist.logo
    fill_in "Minimum withdrawl", with: @applist.minimum_withdrawl
    fill_in "Redeem type", with: @applist.redeem_type
    fill_in "Referral code", with: @applist.referral_code
    fill_in "Title", with: @applist.title
    click_on "Create Applist"

    assert_text "Applist was successfully created"
    click_on "Back"
  end

  test "should update Applist" do
    visit applist_url(@applist)
    click_on "Edit this applist", match: :first

    fill_in "App link", with: @applist.app_link
    fill_in "Bonus", with: @applist.bonus
    fill_in "Logo", with: @applist.logo
    fill_in "Minimum withdrawl", with: @applist.minimum_withdrawl
    fill_in "Redeem type", with: @applist.redeem_type
    fill_in "Referral code", with: @applist.referral_code
    fill_in "Title", with: @applist.title
    click_on "Update Applist"

    assert_text "Applist was successfully updated"
    click_on "Back"
  end

  test "should destroy Applist" do
    visit applist_url(@applist)
    click_on "Destroy this applist", match: :first

    assert_text "Applist was successfully destroyed"
  end
end
