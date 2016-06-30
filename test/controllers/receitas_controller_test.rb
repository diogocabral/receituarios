require 'test_helper'

class ReceitasControllerTest < ActionController::TestCase
  setup do
    @receita = receita(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receita)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receita" do
    assert_difference('Receita.count') do
      post :create, receita: { nome: @receita.nome }
    end

    assert_redirected_to receita_path(assigns(:receita))
  end

  test "should show receita" do
    get :show, id: @receita
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receita
    assert_response :success
  end

  test "should update receita" do
    patch :update, id: @receita, receita: { nome: @receita.nome }
    assert_redirected_to receita_path(assigns(:receita))
  end

  test "should destroy receita" do
    assert_difference('Receita.count', -1) do
      delete :destroy, id: @receita
    end

    assert_redirected_to receita_path
  end
end
