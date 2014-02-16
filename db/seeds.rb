pages = %w(home about)

pages.each do |page|
  Page.create(title: page.capitalize)
end
