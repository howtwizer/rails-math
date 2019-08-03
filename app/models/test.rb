class Test < ApplicationRecord
  before_create :calculate_result

  validates_presence_of :result

  def calculate_result
    self.right = result == instance_eval("#{a}#{sign}#{b}")
  end

  def string_result
    right ? 'Верно' : 'Неверно'
  end

  def multiplex_and_devide
    self.a    = rand(2..10)
    self.b    = rand(2..10)
    self.sign = if (((self.a % self.b) == 0) && (self.a > self.b))
                  ['*', '/'].sample
                else
                  '*'
                end
  end

  def addition_and_substraction
    self.a    = rand(2..100)
    self.b    = rand(2..100)
    self.sign = if (self.a > self.b)
                  ['+', '-'].sample
                else
                  '+'
                end
  end

end
