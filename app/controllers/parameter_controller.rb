class ParameterController < ApplicationController
  def index
    render json: params.to_json
  end
end
