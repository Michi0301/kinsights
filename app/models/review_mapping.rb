# frozen_string_literal: true

module ReviewMapping
  module EmployeeReview
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

  module ApplicantReview
    module Scores
      MAPPING = {
        'Zufriedenstellende Reaktion' => 'response_quality_rating',
        'Schnelle Antwort' => 'response_time_rating',
        'Erwartbarkeit des Prozesses' => 'application_process_rating',
        'Professionalität des Gesprächs' => 'interview_professionality_rating',
        'Vollständigkeit der Infos' => 'information_completeness_rating',
        'Angenehme Atmosphäre' => 'interview_mood_rating',
        'Wertschätzende Behandlung' => 'applicant_threatment_rating',
        'Zufriedenstellende Antworten' => 'answer_quality_rating',
        'Erklärung der weiteren Schritte' => 'further_steps_rating',
        'Zeitgerechte Ab- / Zusage' => 'timely_interview_result_rating'
      }.freeze
    end

    module UserContent
      MAPPING = {
        'Firma' => 'company_name',
        'Stadt' => 'city',
        'Beworben für Position' => 'position',
        'Jahr der Bewerbung' => 'application_year',
        'Ergebnis' => 'result'
      }.freeze
    end
  end

  module ApprenticeReview
    module Scores
      MAPPING = {
        'Die Ausbilder' => 'instructor_rating',
        'Spaßfaktor' => 'fun_rating',
        'Aufgaben/Tätigkeiten' => 'tasks_rating',
        'Abwechslung' => 'diversity_rating',
        'Respekt' => 'respect_rating',
        'Karrierechancen' => 'career_rating',
        'Betriebsklima' => 'working_atmosphere_rating',
        'Ausbildungsvergütung' => 'salary_rating',
        'Arbeitszeiten' => 'working_hours_rating'
      }.freeze
    end

    module UserContent
      MAPPING = {
        'Firma' => 'company_name',
        'Stadt' => 'city',
        'Jobstatus' => 'job_state',
        'Unternehmensbereich' => 'department'
      }.freeze
    end
  end
end
