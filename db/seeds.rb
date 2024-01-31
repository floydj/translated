# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

ActiveRecord::Base.connection.execute("insert into translations (locale, translations.key, value, created_at, updated_at) values ('en', 'percentage_neat_oil', '--- \"% Neat Oil\"\n', '2024-01-30', '2024-01-30')")
