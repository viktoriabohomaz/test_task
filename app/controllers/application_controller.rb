# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound do
    redirect_to :root
  end
end
