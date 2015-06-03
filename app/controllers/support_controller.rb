class SupportController < ApplicationController

  def view
    @meter = current_event.funding_meter
  end

end
