require "test_helper"

class WithdrawlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @withdrawl = withdrawls(:one)
  end

  test "should get index" do
    get withdrawls_url
    assert_response :success
  end

  test "should get new" do
    get new_withdrawl_url
    assert_response :success
  end

  test "should create withdrawl" do
    assert_difference("Withdrawl.count") do
      post withdrawls_url, params: { withdrawl: { account_id: @withdrawl.account_id, amount: @withdrawl.amount, coins: @withdrawl.coins, transaction_id: @withdrawl.transaction_id } }
    end

    assert_redirected_to withdrawl_url(Withdrawl.last)
  end

  test "should show withdrawl" do
    get withdrawl_url(@withdrawl)
    assert_response :success
  end

  test "should get edit" do
    get edit_withdrawl_url(@withdrawl)
    assert_response :success
  end

  test "should update withdrawl" do
    patch withdrawl_url(@withdrawl), params: { withdrawl: { account_id: @withdrawl.account_id, amount: @withdrawl.amount, coins: @withdrawl.coins, transaction_id: @withdrawl.transaction_id } }
    assert_redirected_to withdrawl_url(@withdrawl)
  end

  test "should destroy withdrawl" do
    assert_difference("Withdrawl.count", -1) do
      delete withdrawl_url(@withdrawl)
    end

    assert_redirected_to withdrawls_url
  end
end
