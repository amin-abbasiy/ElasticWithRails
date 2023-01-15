class Api::V1::LogsController < Api::V1::BaseController
  def create
    @response = ::Logs.new(whitelist_params).call
  end

  def search

  end

  def whitelist_params
    params.slice(:data).permit(data: [])
  end
end
