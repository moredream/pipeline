module ArticlesHelper

  def tag_class(level)
    case level
      when "default" then "label label-default"
      when "primary" then "label label-primary"
      when "success" then "label label-success"
      when "info" then "label label-info"
      when "warning" then "label label-warning"
      when "danger" then "label label-danger"
      else  "label label-info"
    end
  end

end
