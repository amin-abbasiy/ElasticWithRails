class ApplicationController < ActionController::Base
  rescue_from :JSONError do |e|
    render_error e.message, :bad_request
  end
  def home
    render json: { message: "Hello and Welcome to Elastic with Rails" }
  end

  protected

  def render_formatted_output(data, status)
    render json: { logs: data }, status: status
  end

  private

  def render_error(massage, code)
    return render json: { error: I18n.t("errors.#{code.to_s}")}, status: code
  end
end
