module ApplicationHelper
  def to_data_html(items)
    cnt = 0
    data_str = '['
    items.each do |item|
      cnt += 1
      data_str << '{'
      attributes = item.attribute_names
      cnt2 = 0
      attributes.each do |attribute|
        cnt2 += 1
        data_str << "'#{attribute}': '#{item[attribute].to_s}'"
        data_str << ',' if cnt2 != attributes.length
      end
      data_str << '}'
      data_str << ",\n" if cnt != items.length
    end
    data_str << ']'
    data_str.html_safe
  end

  def resource_name
    :user
  end

  def resource
    @user ||= User.new
  end
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
