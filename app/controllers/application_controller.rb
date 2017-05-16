class ApplicationController < ActionController::Base
  require 'redcarpet/render_strip'
  protect_from_forgery with: :exception

  private 

  def set_markdowm
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, no_styles: true)
  end
end
