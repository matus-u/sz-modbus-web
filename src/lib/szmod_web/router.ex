defmodule SzmodWeb.Router do
  use SzmodWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SzmodWeb do
    pipe_through :browser

    #get "/", PageController, :index

    #get "/devices", DeviceController, :index

    resources "/devices", DeviceController, only: [ :index, :show ]
    resources "/sensor_types", SensorTypeController, only: [ :index, :show ]
    resources "/sensors", SensorController, only: [ :index, :show ]
    resources "/characteristic_types", CharacteristicTypeController, only: [ :index, :show ]

  end

  # Other scopes may use custom stacks.
  # scope "/api", SzmodWeb do
  #   pipe_through :api
  # end
end
