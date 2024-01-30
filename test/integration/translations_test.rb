require "test_helper"

class TranslationsTest < ActionDispatch::IntegrationTest
  include Capybara::Minitest::Assertions
  include Capybara::DSL

  test "check translation without starting percent sign" do
    ActiveRecord::Base.connection.execute("insert into translations (locale, translations.key, value, created_at, updated_at) values ('en', 'percentage_neat_oil', 'padding % Neat Oil', '2024-01-30', '2024-01-30')")
    visit root_path
    assert_selector "td", text: "padding % Neat Oil"
    Translation.destroy_all
  end

  test "check translation with start percent sign" do
    ActiveRecord::Base.connection.execute("insert into translations (locale, translations.key, value, created_at, updated_at) values ('en', 'percentage_neat_oil', '% Neat Oil', '2024-01-30', '2024-01-30')")
    visit root_path
    assert_selector "td", text: "% Neat Oil"
    Translation.destroy_all
  end

  test "check translation with colon" do
    ActiveRecord::Base.connection.execute("insert into translations (locale, translations.key, value, created_at, updated_at) values ('en', 'ending_colon', 'Ending colon:', '2024-01-30', '2024-01-30')")
    visit root_path
    assert_selector "td", text: "Ending colon:"
    Translation.destroy_all
  end
end
