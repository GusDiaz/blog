require 'redcarpet'
require 'redcarpet/render_strip'

class Post < ApplicationRecord

  def save
    generate_html_and_preview
    super
  end

  def update(attribute_names)
    generate_html_and_preview
    super(attribute_names)
  end

  def date
    self.updated_at.to_s(:long)
  end

  private
    def generate_html_and_preview
      text_only    = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
      markdown     = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true, strikethrough: true, underline: true, highlight: true, quote: true)
      self.html    = markdown.render(self.content)
      self.preview = text_only.render(self.content).to(300)
    end
end
