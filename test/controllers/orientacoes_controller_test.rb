require 'test_helper'

class OrientacoesControllerTest < ActionController::TestCase
  setup do
    @orientacao = orientacao(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orientacao)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orientacao" do
    assert_difference('Receita.count') do
      post :create, orientacao: { nome: @orientacao.nome }
    end

    assert_redirected_to orientacao_path(assigns(:orientacao))
  end

  test "should show orientacao" do
    get :show, id: @orientacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orientacao
    assert_response :success
  end

  test "should update orientacao" do
    patch :update, id: @orientacao, orientacao: { nome: @orientacao.nome }
    assert_redirected_to orientacao_path(assigns(:orientacao))
  end

  test "should destroy orientacao" do
    assert_difference('Receita.count', -1) do
      delete :destroy, id: @orientacao
    end

    assert_redirected_to orientacao_path
  end
end
