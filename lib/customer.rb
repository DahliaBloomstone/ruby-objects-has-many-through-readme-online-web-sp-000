class Customer
attr_accessor :name, :age #each customer instance has a name and age 
#attr_accessor allows for customer to change their name and age 
#attr_reader would not allow for a customer to change their name and age


@@all = [ ] #creates a new array of instances 

def initialize(name, age) #initializes w a name and age
  @name = name
  @age = age
@@all << self
end

def self.all #returns the contents of @@all
  @@all
end

def new_meal(waiter, total, tip=0) #initializes a meal using the current Customer instance
  Meal.new(waiter, self, total, tip) #provided a Waiter instance, a total, and a tip
end

def meals #returns an array of Meal instances associated with this customer
  Meal.all.select do |meal| #by iteration over every meal the customer had
    meal.customer == self
  end
end

def waiters #returns an array of Waiter instances
  meals.map do |meal| #by iterating over each meal the waiter gave
    meal.waiter
  end
end

end
