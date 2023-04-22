require "test_helper"

class RecyclableMaterialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recyclable_material = recyclable_materials(:one)
  end

  test "should get index" do
    get recyclable_materials_url
    assert_response :success
  end

  test "should get new" do
    get new_recyclable_material_url
    assert_response :success
  end

  test "should create recyclable_material" do
    assert_difference("RecyclableMaterial.count") do
      post recyclable_materials_url, params: { recyclable_material: { category: @recyclable_material.category, description: @recyclable_material.description, name: @recyclable_material.name } }
    end

    assert_redirected_to recyclable_materials_url
  end

  test "should show recyclable_material" do
    get recyclable_material_url(@recyclable_material)
    assert_response :success
  end

  test "should get edit" do
    get edit_recyclable_material_url(@recyclable_material)
    assert_response :success
  end

  test "should update recyclable_material" do
    patch recyclable_material_url(@recyclable_material), params: { recyclable_material: { category: @recyclable_material.category, description: @recyclable_material.description, name: @recyclable_material.name } }
    assert_redirected_to recyclable_materials_url
  end

  test "should destroy recyclable_material" do
    assert_difference("RecyclableMaterial.count", -1) do
      delete recyclable_material_url(@recyclable_material)
    end

    assert_redirected_to recyclable_materials_url
  end
end
