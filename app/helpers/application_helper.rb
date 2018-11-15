module ApplicationHelper
  def bootstrap_class_for flash_type
    {:success => "success",
     :error => "danger",
     "error" => "danger",
     :alert => "warning",
     "alert" => "warning",
     :notice => "info",
     "notice" => "info",}[flash_type] || flash_type.to_s
  end
end
