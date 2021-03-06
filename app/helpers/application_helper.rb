module ApplicationHelper
  include Pagy::Frontend

  def browser_title
    page_browser_title = content_for(:browser_title).presence || content_for(:title)
    [page_browser_title, t('service_name'), 'GOV.UK'].select(&:present?).join(' - ')
  end

  def yes_no_options
    [
      OpenStruct.new(id: 'yes', name: 'Yes'),
      OpenStruct.new(id: 'no', name: 'No'),
    ]
  end

  def nav_item(title: nil, url: nil, content: nil)
    class_name = 'govuk-header__navigation-item'
    class_name = [class_name, 'govuk-header__navigation-item--active'].join(' ') if request.path == url

    inner_html = (title.present? ? link_to(title, url, class: 'govuk-header__link') : content)
    content_tag(:li, inner_html, class: class_name)
  end
end
