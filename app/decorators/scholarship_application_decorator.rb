class ScholarshipApplicationDecorator < Draper::Decorator
  delegate_all

  def help_needed
    [
      ["Ticket", needs_help_with_tickets],
      ["Travel", needs_help_with_travel],
      ["Other", needs_help_with_other],
    ].map { |type, value|
      if value
        type
      end
    }.compact.join(", ")
  end

  def name
    "#{first_name} #{last_name}"
  end
end
