class Api::V1::LogsController < Api::V1::BaseController
  def create
    @log = ::Logs.new(whitelist_params, self).call

    render json: { data: @log.response.body }, status: @log.status
  end

  def search

  end

  def whitelist_params
    params.slice(:data).permit(data: [])
  end
end
