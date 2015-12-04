module EventsHelper
  def event_content(event)
    "#{I18n.t("events.#{event.key.gsub('_', '.')}", event.options)} : "
  end

  def firer_options(firers, selected = nil)
    options_from_collection_for_select(firers, "id", "nickname", selected)
  end
end
