require "application_system_test_case"

class AsetsTest < ApplicationSystemTestCase
  setup do
    @aset = asets(:one)
  end

  test "visiting the index" do
    visit asets_url
    assert_selector "h1", text: "Asets"
  end

  test "should create aset" do
    visit asets_url
    click_on "New aset"

    fill_in "Asset category", with: @aset.asset_category
    fill_in "Asset status", with: @aset.asset_status
    fill_in "Current owner", with: @aset.current_owner
    fill_in "Location", with: @aset.location
    fill_in "Maintenance history", with: @aset.maintenance_history
    fill_in "Name", with: @aset.name
    fill_in "Purchase date", with: @aset.purchase_date
    fill_in "Purchase price", with: @aset.purchase_price
    fill_in "Serial number", with: @aset.serial_number
    fill_in "Warranty expiration date", with: @aset.warranty_expiration_date
    click_on "Create Aset"

    assert_text "Aset was successfully created"
    click_on "Back"
  end

  test "should update Aset" do
    visit aset_url(@aset)
    click_on "Edit this aset", match: :first

    fill_in "Asset category", with: @aset.asset_category
    fill_in "Asset status", with: @aset.asset_status
    fill_in "Current owner", with: @aset.current_owner
    fill_in "Location", with: @aset.location
    fill_in "Maintenance history", with: @aset.maintenance_history
    fill_in "Name", with: @aset.name
    fill_in "Purchase date", with: @aset.purchase_date
    fill_in "Purchase price", with: @aset.purchase_price
    fill_in "Serial number", with: @aset.serial_number
    fill_in "Warranty expiration date", with: @aset.warranty_expiration_date
    click_on "Update Aset"

    assert_text "Aset was successfully updated"
    click_on "Back"
  end

  test "should destroy Aset" do
    visit aset_url(@aset)
    click_on "Destroy this aset", match: :first

    assert_text "Aset was successfully destroyed"
  end
end
