namespace :test do

  task :command, [:param_1, :param_2] => :environment do |t, args|
    puts "#{args[:param_1]} - #{args[:param_2]}"

  end

end
