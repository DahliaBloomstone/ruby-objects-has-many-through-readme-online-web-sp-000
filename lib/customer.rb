class Customer
attr_accessor :name, :age

@@all = [ ]

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
