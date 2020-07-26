module EnrollmentsHelper
  def self.to_data_html(enrollments)
    cnt = 0
    data_str = '['
    enrollments.each do |enrollment|
      cnt += 1
      data_str << '{'
      data_str << "'user': '#{enrollment.user.email}',"
      data_str << "'course': '#{enrollment.course.title}'"
      data_str << '}'
      if cnt != enrollments.length
        data_str << ",\n"
      end
    end
    data_str << ']'
    data_str.html_safe
  end
end
