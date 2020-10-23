# require_relative './Manager.rb'

class Employee 
    attr_accessor :name, :title, :salary, :boss
    def initialize(name,title,salary,boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        #  boss.employess += self
        # @employees = []
    end
    def bonus(multiplier)
        bonus = @salary * multiplier
    end
end

class Manager < Employee 
    attr_accessor :employees #:name, :title, :salary, :boss,
    def initialize(name,title,salary,boss)
        super #(name,title,salary,boss)
        # @name = name
        # @title = title
        # @salary = salary
        # @boss = boss 
        @employees = []
    end

    def bonus(multiplier)
        super
        total = 0
        @employees.each {|employee| total += (employee.salary)}
        return (total * multiplier) 
    end

end

ned = Manager.new("Ned","Founder",1000000,nil) # Ned	\$1,000,000	Founder	nil
darren = Manager.new("Darren","TA Manager",78000,ned) # Darren	\$78,000	TA Manager	Ned
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)
# then we should have bonuses like this:
# p david.salary
# p ned.name
# p darren.name


 ned.employees << darren 
ned.employees << shawna << david
darren.employees << shawna << david

# # p ned.employees


p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000