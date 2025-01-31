class ApiController < ActionController::API
  WHITELISTED_DOMAINS = ['oms-tokyotreat-staging.myshopify.com'].freeze # TODO

  before_action :valid_request?

  protected

  def valid_request?
    unless request.origin.present? && WHITELISTED_DOMAINS.include?(URI.parse(request.origin).host)
      render json: { msg: 'Sorry, you don\'t have any access to this websote.' }, status: 403
    end
  end
end
