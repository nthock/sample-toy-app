defmodule ApiWeb.PagesControllerTest do
  use ApiWeb.ConnCase

  describe "GET /" do
    test "should be able to get 200 status", %{conn: conn} do
      result =
        conn
        |> get("/")
        |> json_response(200)

      assert %{"message" => _message} = result
    end
  end
end
