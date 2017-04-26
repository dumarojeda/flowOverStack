class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private 

  def set_markdowm
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, no_styles: true)
  end
end
