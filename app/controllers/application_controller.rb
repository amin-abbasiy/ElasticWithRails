class ApplicationController < ActionController::Base
  before_action :capture_data

  rescue_from ::JSON::JSONError do |e|
    render_error e.message, :bad_request
  end
  def home
    render json: { message: I18n.t("messages.welcome") }
  end

  protected
  def save_data
    data = {
            ip: request.remote_ip,
            path: request.path,
            creation_time: Time.now,
            request_info: {
              request_id: request.request_id,
              method: request.method,
              url: request.url
            }
          }

    ::Logs::Create.new(data, self).call
  end

  def render_formatted_output(data, status)
    render json: { logs: data }, status: status
  end

  private

  def render_error(massage, code)
    return render json: { error: { code: I18n.t("errors.#{code.to_s}") }
                                   .merge(message: massage) }, status: code
  end
end
