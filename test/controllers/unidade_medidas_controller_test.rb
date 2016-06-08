require 'test_helper'

class UnidadeMedidasControllerTest < ActionController::TestCase
  setup do
    @unidade_medida = unidades_medida(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unidades_medida)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unidade_medida" do
    assert_difference('UnidadeMedida.count') do
      post :create, unidade_medida: { nome: @unidade_medida.nome }
    end

    assert_redirected_to unidade_medida_path(assigns(:unidade_medida))
  end

  test "should show unidade_medida" do
    get :show, id: @unidade_medida
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unidade_medida
    assert_response :success
  end

  test "should update unidade_medida" do
    patch :update, id: @unidade_medida, unidade_medida: { nome: @unidade_medida.nome }
    assert_redirected_to unidade_medida_path(assigns(:unidade_medida))
  end

  test "should destroy unidade_medida" do
    assert_difference('UnidadeMedida.count', -1) do
      delete :destroy, id: @unidade_medida
    end

    assert_redirected_to unidades_medida_path
  end
end
