# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    render json: { users: [{ name: 'John Doe' }] }
  end
end
