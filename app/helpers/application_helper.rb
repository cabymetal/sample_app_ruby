module ApplicationHelper
  #returns the full title on a per-page basis
  def full_title(page_tittle = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_tittle.empty?
      base_title
    else
      page_tittle + ' | ' + base_title
    end
  end
end
