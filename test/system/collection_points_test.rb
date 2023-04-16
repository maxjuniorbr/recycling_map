require "application_system_test_case"

class CollectionPointsTest < ApplicationSystemTestCase
  setup do
    @collection_point = collection_points(:one)
  end

  test "visiting the index" do
    visit collection_points_url
    assert_selector "h1", text: "Collection points"
  end

  test "should create collection point" do
    visit collection_points_url
    click_on "New collection point"

    fill_in "Address", with: @collection_point.address
    fill_in "Contact", with: @collection_point.contact
    fill_in "Latitude", with: @collection_point.latitude
    fill_in "Longitude", with: @collection_point.longitude
    fill_in "Name", with: @collection_point.name
    fill_in "Website", with: @collection_point.website
    click_on "Create Collection point"

    assert_text "Collection point was successfully created"
    click_on "Back"
  end

  test "should update Collection point" do
    visit collection_point_url(@collection_point)
    click_on "Edit this collection point", match: :first

    fill_in "Address", with: @collection_point.address
    fill_in "Contact", with: @collection_point.contact
    fill_in "Latitude", with: @collection_point.latitude
    fill_in "Longitude", with: @collection_point.longitude
    fill_in "Name", with: @collection_point.name
    fill_in "Website", with: @collection_point.website
    click_on "Update Collection point"

    assert_text "Collection point was successfully updated"
    click_on "Back"
  end

  test "should destroy Collection point" do
    visit collection_point_url(@collection_point)
    click_on "Destroy this collection point", match: :first

    assert_text "Collection point was successfully destroyed"
  end
end
