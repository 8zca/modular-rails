# frozen_string_literal: true

class OrgsController < ApplicationController
  def index
    render json: { orgs: [{ name: 'Foo inc.' }] }
  end
end
