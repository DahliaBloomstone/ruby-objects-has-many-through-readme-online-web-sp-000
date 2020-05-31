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

def meals #returns an array of meal instances associated with this customer
  Meal.all.select do |meal| #by iteration over every meal the customer had 
    meal.customer == self
  end
end

def waiters
  meals.map do |meal|
    meal.waiter
  end
end

end
