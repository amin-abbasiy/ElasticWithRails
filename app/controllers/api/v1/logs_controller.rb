class Api::V1::LogsController < Api::V1::BaseController
  def create
    @log = ::Logs.new(whitelist_params, self).call

    render_formatted_output @log.response.body, @log.status
  end

  def search
    @logs = ::LogSearch.new(params[:term], self).call

    render_formatted_output @logs.response.body, @log.status
  end

  def whitelist_params
    params.slice(:data).permit(data: [])
  end
end
