# frozen_string_literal: true

company = Company.find_or_create_by(name: 'Fidor Group')
company.url = 'https://www.kununu.com/de/fidor-group'
company.save!
