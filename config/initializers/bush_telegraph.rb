Dir.glob(Rails.root.join('app/decorators/events/*')).each {|filename| require filename}