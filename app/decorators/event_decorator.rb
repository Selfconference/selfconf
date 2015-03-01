class EventDecorator < Draper::Decorator
  delegate_all

  def when
    month = start_date.strftime("%b").titleize
    year = start_date.strftime("%Y")
    start_day = start_date.strftime("%e").squeeze(" ")
    end_day = end_date.strftime("%e").squeeze(" ")

    "#{month} #{start_day}-#{end_day}, #{year}"
  end

end
