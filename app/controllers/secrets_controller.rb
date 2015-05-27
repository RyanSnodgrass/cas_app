class SecretsController < ApplicationController
  def show
    authenticate
  end
end
