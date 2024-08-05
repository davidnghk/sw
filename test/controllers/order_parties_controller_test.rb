require 'test_helper'

class OrderPartiesControllerTest < ActionController::TestCase
  setup do
    @order_party = order_parties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_parties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_party" do
    assert_difference('OrderParty.count') do
      post :create, order_party: { designation: @order_party.designation, name: @order_party.name, order_id: @order_party.order_id, organization: @order_party.organization }
    end

    assert_redirected_to order_party_path(assigns(:order_party))
  end

  test "should show order_party" do
    get :show, id: @order_party
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_party
    assert_response :success
  end

  test "should update order_party" do
    patch :update, id: @order_party, order_party: { designation: @order_party.designation, name: @order_party.name, order_id: @order_party.order_id, organization: @order_party.organization }
    assert_redirected_to order_party_path(assigns(:order_party))
  end

  test "should destroy order_party" do
    assert_difference('OrderParty.count', -1) do
      delete :destroy, id: @order_party
    end

    assert_redirected_to order_parties_path
  end
end
