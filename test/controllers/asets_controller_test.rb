require "test_helper"

class AsetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aset = asets(:one)
  end

  test "should get index" do
    get asets_url
    assert_response :success
  end

  test "should get new" do
    get new_aset_url
    assert_response :success
  end

  test "should create aset" do
    assert_difference("Aset.count") do
      post asets_url, params: { aset: { asset_category: @aset.asset_category, asset_status: @aset.asset_status, current_owner: @aset.current_owner, location: @aset.location, maintenance_history: @aset.maintenance_history, name: @aset.name, purchase_date: @aset.purchase_date, purchase_price: @aset.purchase_price, serial_number: @aset.serial_number, warranty_expiration_date: @aset.warranty_expiration_date } }
    end

    assert_redirected_to aset_url(Aset.last)
  end

  test "should show aset" do
    get aset_url(@aset)
    assert_response :success
  end

  test "should get edit" do
    get edit_aset_url(@aset)
    assert_response :success
  end

  test "should update aset" do
    patch aset_url(@aset), params: { aset: { asset_category: @aset.asset_category, asset_status: @aset.asset_status, current_owner: @aset.current_owner, location: @aset.location, maintenance_history: @aset.maintenance_history, name: @aset.name, purchase_date: @aset.purchase_date, purchase_price: @aset.purchase_price, serial_number: @aset.serial_number, warranty_expiration_date: @aset.warranty_expiration_date } }
    assert_redirected_to aset_url(@aset)
  end

  test "should destroy aset" do
    assert_difference("Aset.count", -1) do
      delete aset_url(@aset)
    end

    assert_redirected_to asets_url
  end
end
