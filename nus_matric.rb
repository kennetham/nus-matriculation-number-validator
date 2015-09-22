#!/bin/env ruby

# Ruby version of NUS Matriculation Number Calculator
# Inspired by https://github.com/nusmodifications/nus-matriculation-number-calculator

def calculate_nus_matric_number(id)
  matric_regex = /^A\d{7}|U\d{6,7}/
  matches = matric_regex.match(id.upcase)

  if (matches)
    match = matches[0]

    if (match[0].eql?('U') && match.length === 8)
      match = match[0, 3] + match[4]
    end

    weights = {
      U: [0, 1, 3, 1, 2, 7],
      A: [1, 1, 1, 1, 1, 1]
    }

    weights = weights[:"#{match[0]}"]

    sum = 0
    digits = match[2, 7]

    for i in 0..6 do
      sum += weights[i].to_i * digits[i].to_i
    end

    match.to_s + 'YXWURNMLJHEAB' [sum % 13]
  end
end
