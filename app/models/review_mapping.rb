# encoding: UTF-8
module ReviewMapping
  module Scores
    MAPPING = {
      'Umwelt- / Sozialbewusstsein' => 'social_rating',
      'Work-Life-Balance' => 'work_life_rating',
      'Image' => 'image_rating',
      'Arbeitsatmosphäre' => 'work_environment_rating',
      'Vorgesetztenverhalten' => 'supervisor_behavior_rating',
      'Kollegenzusammenhalt' => 'colleague_behavior_rating',
      'Interessante Aufgaben' => 'interesting_tasks_rating',
      'Kommunikation' => 'communication_rating',
      'Gleichberechtigung' => 'equality_rating',
      'Umgang mit älteren Kollegen' => 'elder_colleagues_rating',
      'Karriere / Weiterbildung' => 'career_rating',
      'Gehalt / Sozialleistungen' => 'salary_rating',
      'Arbeitsbedingungen' => 'working_conditions_rating'
    }.freeze
  end

  module UserContent
    MAPPING = {
      'Firma' => 'company_name',
      'Stadt' => 'city',
      'Jobstatus' => 'job_state',
      'Position/Hierarchie' => 'position',
      'Unternehmensbereich' => 'department'
    }.freeze
  end
end
