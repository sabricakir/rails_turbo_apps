module GamesHelper
  def get_hashtags_or_mentions(text)
    regex = /#\w+/
    text_class = "text-green-500"
    text = find_by_regex(regex, text, text_class)
    regex = /@\w+/
    text_class = "text-purple-500"
    text = find_by_regex(regex, text, text_class)
    text
  end

  def find_by_regex(regex, text, text_class = "text-blue-300")
    results = text.scan(regex)
    results.each do |result|
      result_link = link_to(result, games_path(search: result), class: text_class)
      text.gsub!(result, result_link)
    end
    text
  end
end
