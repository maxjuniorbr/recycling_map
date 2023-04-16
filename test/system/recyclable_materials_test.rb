require "application_system_test_case"

class RecyclableMaterialsTest < ApplicationSystemTestCase
  setup do
    @recyclable_material = recyclable_materials(:one)
  end

  test "visiting the index" do
    visit recyclable_materials_url
    assert_selector "h1", text: "Recyclable materials"
  end

  test "should create recyclable material" do
    visit recyclable_materials_url
    click_on "New recyclable material"

    fill_in "Category", with: @recyclable_material.category
    fill_in "Description", with: @recyclable_material.description
    fill_in "Name", with: @recyclable_material.name
    click_on "Create Recyclable material"

    assert_text "Recyclable material was successfully created"
    click_on "Back"
  end

  test "should update Recyclable material" do
    visit recyclable_material_url(@recyclable_material)
    click_on "Edit this recyclable material", match: :first

    fill_in "Category", with: @recyclable_material.category
    fill_in "Description", with: @recyclable_material.description
    fill_in "Name", with: @recyclable_material.name
    click_on "Update Recyclable material"

    assert_text "Recyclable material was successfully updated"
    click_on "Back"
  end

  test "should destroy Recyclable material" do
    visit recyclable_material_url(@recyclable_material)
    click_on "Destroy this recyclable material", match: :first

    assert_text "Recyclable material was successfully destroyed"
  end
end
