module ApplicationHelper
	def markdown(text)
	 	markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
	    autolink: true, tables: true, quote: true, highlight: true, underline: true)
		return markdown.render(text).html_safe
	end
end
