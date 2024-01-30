I18n.available_locales = [:en, :cn]

module I18n
  def self.name_for_locale(locale)
    Rails.logger.info "--- name_for_locale ---"
    I18n.backend.translate(locale, "i18n.language.name")
  rescue I18n::MissingTranslation
    locale.to_s
  end
end
