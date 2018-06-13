module CompanyStatsMapping
  MAPPING = {
    employee_rating_count: {
      xpath: '/html/body/main/div[1]/div[3]/div[2]/section[1]/div/ul/li[1]/h2',
      parser: Parsers::Integer
    },
    employee_rating_avg: {
      xpath: '/html/body/main/div[1]/div[3]/div[2]/section[1]/div/ul/li[1]/div/div/div[2]/div/div',
      parser: Parsers::CommaFloat
    },
    applicant_rating_count: {
      xpath: '/html/body/main/div[1]/div[3]/div[2]/section[1]/div/ul/li[2]/h2',
      parser: Parsers::Integer
    },
    applicant_rating_avg: {
      xpath: '/html/body/main/div[1]/div[3]/div[2]/section[1]/div/ul/li[2]/div/div/div[2]/div/div/div',
      parser: Parsers::CommaFloat
    },
    trainee_rating_count: {
      xpath: '/html/body/main/div[1]/div[3]/div[2]/section[1]/div/ul/li[3]/h2',
      parser: Parsers::Integer
    },
    trainee_rating_avg: {
      xpath: '/html/body/main/div[1]/div[3]/div[2]/section[1]/div/ul/li[3]/div/div/div[2]/div/div',
      parser: Parsers::CommaFloat
    }
  }.freeze
end