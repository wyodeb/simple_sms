class Api::V1::MessagesController < ApplicationController
  include Authenticable
  before_action :authorize_request
  before_action :validate_params!
  before_action :stop_list, only: [:outbound]
  before_action :throttle_outbound_requests, only: [:outbound]
  before_action :check_if_from_present, only: [:outbound]
  before_action :check_if_to_present, only: [:inbound]

  def inbound
    cache_by_stop_text
    render json: {message: 'inbound sms ok', error: ''}, status: :ok
  end

  def outbound
    render json: {message: 'outbound sms ok', error: ''}, status: :ok
  end

  private
  def check_if_from_present
    unless @current_user.phone_numbers.find_by_number(param_from)&.number == param_from
      render json: {"message":"" , "error": "from parameter not found"}, status: :not_acceptable
    end
  end

  def check_if_to_present
    unless @current_user.phone_numbers.find_by_number(param_to)&.number == param_to
      render json: {"message":"" , "error": "to parameter not found"}, status: :not_acceptable
    end
  end

  def cache_by_stop_text
    return unless stop_text
    Rails.cache.write([param_to, param_from], expires_in: 4.hours, unless_exist: true)
  end

  def stop_text
    params[:text]&.strip&.upcase == 'STOP'
  end
end
