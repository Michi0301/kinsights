class ActiveRecord::Relation
  # Enable sum queries on jsonb stored data
  def sum(arg)
    fields = EmployeeReview::RATINGS_DATA_FIELDS
      .merge(ApplicantReview::RATINGS_DATA_FIELDS)
      .with_indifferent_access
    
    if fields.include?(arg)
      super("(ratings_data->>'#{arg}')::#{fields[arg]}")
    else
      super(arg)
    end
  end
end
