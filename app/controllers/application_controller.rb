class ApplicationController < ActionController::API
  rescue_from RequestParamsValidation::MissingParameterError do |exception|
    render json: {message: '', error: exception}, status: :bad_request
  end
  rescue_from RequestParamsValidation::RequestParamError do |exception|
    render json: {message: '', error: exception}, status: :bad_request
  end

  private

  def stop_list
    return unless read_stop_params
    render json:   {message: '', error: "sms from #{param_from} to #{param_to} blocked by STOP request"},
           status: :locked
  end

  def throttle_outbound_requests
    cache_key = "#{param_from}_count"
    count = Rails.cache.fetch(cache_key, expires_in: TIMING.to_i, raw: true) { 0 }
    if count.to_i >= MAX_REQUESTS
      render json: {message: '', error: "limit reached for: #{param_from}"}, status: :too_many_requests
      return
    end
    Rails.logger.debug Rails.cache.increment(cache_key)
    true
  end

  def param_from
    params[:from]
  end

  def param_to
    params[:to]
  end

  def read_stop_params
    Rails.cache.read([param_to, param_from])
  end

  def check_login
    head :forbidden unless current_user
  end
end
