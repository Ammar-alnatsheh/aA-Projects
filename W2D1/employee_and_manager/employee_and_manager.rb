class Employee

def initialize(name, title, salary, boss)
  @name = name
  @title = title
  @salary = salary
  @boss = boss
end

def bounus(employee)

end

end

class Manager < Employee
  def initialize()
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def make_report
    
  end

end
