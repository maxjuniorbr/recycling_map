require 'test_helper'

class CollectionPointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collection_point = collection_points(:one)
  end

  test 'should get index' do
    get collection_points_url
    assert_response :success
  end

  test 'should get new' do
    get new_collection_point_url
    assert_response :success
  end

  test 'should create collection_point' do
    assert_difference('CollectionPoint.count') do
      post collection_points_url,
           params: { collection_point: { address: @collection_point.address, contact: @collection_point.contact,
                                         latitude: @collection_point.latitude, longitude: @collection_point.longitude, name: @collection_point.name, website: @collection_point.website } }
    end

    assert_redirected_to collection_points_url
  end

  test 'should show collection_point' do
    get collection_point_url(@collection_point)
    assert_response :success
  end

  test 'should get edit' do
    get edit_collection_point_url(@collection_point)
    assert_response :success
  end

  test 'should update collection_point' do
    patch collection_point_url(@collection_point),
          params: { collection_point: { address: @collection_point.address, contact: @collection_point.contact,
                                        latitude: @collection_point.latitude, longitude: @collection_point.longitude, name: @collection_point.name, website: @collection_point.website } }
    assert_redirected_to collection_points_url
  end

  test 'should destroy collection_point' do
    assert_difference('CollectionPoint.count', -1) do
      delete collection_point_url(@collection_point)
    end

    assert_redirected_to collection_points_url
  end
end
