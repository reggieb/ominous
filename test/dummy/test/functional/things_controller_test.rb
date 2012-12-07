require 'test_helper'

class ThingsControllerTest < ActionController::TestCase
  def setup
    @thing = Thing.find(1)
    @thing_with_warning = Thing.find(2)
    @warning = Ominous::Warning.find(1)
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:things)

  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Thing.count') do
      post :create, thing: { name: @thing.name }
    end

    assert_redirected_to thing_path(assigns(:thing))
  end

  def test_show_without_warning
    get :show, id: @thing
    assert_response :success
    assert_no_tag :tag => "div", :attributes => { :class => "ominous_warning" }
  end
  
  def test_show_with_warning
    get :show, id: @thing_with_warning
    assert_response :success
    assert_tag :tag => "div", :attributes => { :class => "ominous_warning" }
  end
  
  def test_show_when_thing_without_warning_but_warning_in_session
    get :show, {id: @thing}, {:ominous_warnings => [@warning.name]}
    assert_response :success
    assert_tag :tag => "div", :attributes => { :class => "ominous_warning" }
  end

  def test_edit
    get :edit, id: @thing
    assert_response :success
  end

  def test_update
    put :update, id: @thing, thing: { name: @thing.name }
    assert_redirected_to thing_path(assigns(:thing))
  end

  def test_destroy
    assert_difference('Thing.count', -1) do
      delete :destroy, id: @thing
    end

    assert_redirected_to things_path
  end
end
