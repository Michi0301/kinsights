namespace :snapshots do
  desc "Creates a snapshot for all registered companies."
  task :create => :environment do
    Company.find_each do |company|
      CreateSnapshot.new(company).call
    end
  end
end