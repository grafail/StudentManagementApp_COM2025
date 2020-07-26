module AssesmentsHelper
  def self.to_data_html(assessments)
    cnt = 0
    data_str = '['
    assessments.each do |assessment|
      cnt += 1
      data_str << '{'
      data_str << "'assesment': '#{assessment.name}',"
      data_str << "'title': '#{assessment.title}',"
      data_str << "'year': '#{assessment.id.to_s}'"
      data_str << '}'
      if cnt != assessments.length
        data_str << ",\n"
      end
    end
    data_str << ']'
    data_str.html_safe
  end
end
