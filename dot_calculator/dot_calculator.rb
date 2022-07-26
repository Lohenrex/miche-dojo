# frozen_string_literal: true

def dot_calculator(equation)
  operand1, operator, operand2 = equation.split(' ')
  result = operand1.length.method(operator[0]).call(operand2.length)
  ''.rjust(result, '.')
end
