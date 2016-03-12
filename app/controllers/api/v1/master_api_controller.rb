class Api::V1::MasterApiController < ApplicationController
  protect_from_forgery with: :null_session
  include Api::V1::SessionHelper
end
