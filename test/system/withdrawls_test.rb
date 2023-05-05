require "application_system_test_case"

class WithdrawlsTest < ApplicationSystemTestCase
  setup do
    @withdrawl = withdrawls(:one)
  end

  test "visiting the index" do
    visit withdrawls_url
    assert_selector "h1", text: "Withdrawls"
  end

  test "should create withdrawl" do
    visit withdrawls_url
    click_on "New withdrawl"

    fill_in "Account", with: @withdrawl.account_id
    fill_in "Amount", with: @withdrawl.amount
    fill_in "Coins", with: @withdrawl.coins
    fill_in "Transaction", with: @withdrawl.transaction_id
    click_on "Create Withdrawl"

    assert_text "Withdrawl was successfully created"
    click_on "Back"
  end

  test "should update Withdrawl" do
    visit withdrawl_url(@withdrawl)
    click_on "Edit this withdrawl", match: :first

    fill_in "Account", with: @withdrawl.account_id
    fill_in "Amount", with: @withdrawl.amount
    fill_in "Coins", with: @withdrawl.coins
    fill_in "Transaction", with: @withdrawl.transaction_id
    click_on "Update Withdrawl"

    assert_text "Withdrawl was successfully updated"
    click_on "Back"
  end

  test "should destroy Withdrawl" do
    visit withdrawl_url(@withdrawl)
    click_on "Destroy this withdrawl", match: :first

    assert_text "Withdrawl was successfully destroyed"
  end
end
