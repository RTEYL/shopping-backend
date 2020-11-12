class StaticController < ApplicationController
  def home
    render json: 'success'
  end
end