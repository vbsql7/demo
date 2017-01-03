# Function: Flatten an arbitrary array of integers
# Example:
# Input: [[1,2,[3],[4,5,[6,7]],8],[],9]
# Output: [1, 2, 3, 4, 5, 6, 7, 8, 9]

# Recursive function to examine and return flattened array elements
def ExtractArrayItems(arrElement)

    if arrElement.kind_of?(Array)
      sLocal = ""
      arrElement.each do |arrSubElement|
        sResult = ExtractArrayItems(arrSubElement)
        # Don't add empty array values to the string
        if (sLocal.length > 0) and (sResult.length > 0)
          sLocal += ","
        end
        sLocal += sResult
      end
      return sLocal
    else
      if arrElement.kind_of?(Integer)
        return arrElement.to_s
      else
        # Ignore non-integer values
        return ""
      end
    end
    
end

# Create an arbitrary Array for testing
arrTest = Array[[1,2,[3],[4,5,[6,7]],8],[],9]

# Produce flattened array
sResult = ExtractArrayItems(arrTest)

# Convert string to integer array
arrFlat = sResult.split(',').map { |s| s.to_i }

# Print the results
puts arrFlat.to_s