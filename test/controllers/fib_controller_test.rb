require "test_helper"

class FibControllerTest < ActionDispatch::IntegrationTest
  #正常値のテスト
  test "正常値のテスト１" do
    get fib_path(id: 5)
    assert_response :success
    json = JSON.parse(@response.body)
    assert_equal 5, json["result"]
  end

  test "正常値のテスト２" do
    get fib_path(id: 99)
    assert_response :success
    json = JSON.parse(@response.body)
    assert_equal 218922995834555169026, json["result"]
  end

  #エラー値のテスト
  test "負の数" do
    get fib_path(id: -1)
    assert_response :bad_request
    json = JSON.parse(@response.body)
    assert_equal "Bad request", json["message"]
  end

  test "文字列" do
    get fib_path(id: "あ")
    assert_response :bad_request
    json = JSON.parse(@response.body)
    assert_equal "Bad request", json["message"]
  end

end
