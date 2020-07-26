module GradesHelper
  def self.to_data_html(grades)
    cnt = 0
    data_str = '['
    grades.each do |grade|
      cnt += 1
      data_str << '{'
      data_str << "'assessment': '#{grade.assesment.name}',"
      data_str << "'user': '#{grade.user.email}',"
      data_str << "'grade': '#{grade.grade}'"
      data_str << '}'
      if cnt != grades.length
        data_str << ",\n"
      end
    end
    data_str << ']'
    data_str.html_safe
  end
end
