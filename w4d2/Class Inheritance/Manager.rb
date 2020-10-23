require_relative './Employee.rb'

class Manager < Employee 
    attr_accessor :name, :title, :salary, :boss, :employees
    def initialize(name,title,salary,boss)
        super(@name,@title,@salary,@boss)
        # @name = name
        # @title = title
        # @salary = salary
        # @boss = boss 
        @employees = []
    end

    def bonus(multiplier)
        super
        total = @salary
        @employees.each{|employee| total += (employee.salary)}
        return total * multiplier
    end

end


# ned = Manager.new("Ned","Founder",1000000,nil) # Ned	\$1,000,000	Founder	nil
# darren = Manager.new("Darren","TA Manager",78000,ned) # Darren	\$78,000	TA Manager	Ned
# shawna = Employee.new("Shawna", "TA", 12000, darren)
# david = Employee.new("David", "TA", 10000, darren)
# # then we should have bonuses like this:
# ned.employees << darren
# darren.employees << shawna << david


# p ned.bonus(5) # => 500_000
# p darren.bonus(4) # => 88_000
# p david.bonus(3) # => 30_000