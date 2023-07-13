module ApplicationHelper
  include Pagy::Frontend
  def active_link_to(text=nil, path=nil, html_options={}, &block)
    link = block_given? ? text : path
    html_options[:class] = class_names(html_options[:class], 'text-green-500 font-bold') if current_page?(link)
    if block_given?
      link_to(text, html_options, &block)
    else
      link_to(text, path, html_options)
    end
  end
end
