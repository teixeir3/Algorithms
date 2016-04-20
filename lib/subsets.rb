def subsets(set)
  return [[]] if set.empty?
  
  smaller_set = set.take(set.count - 1)  # excludes the last element
  subsets = subsets(smaller_set)
  bigger_subsets = []
  subsets.each do |smaller_subset|
    bigger_subsets << smaller_subset + [set.last] # tacks on the last element we left out on line 4
  end
  
  subsets + bigger_subsets
end

# Could there be a subsets of ["carl", "jim", "bobby"] (call it S)
# where S - "bobby" is NOT a subset of ["carl", "jim"]?
# NO

p subsets([])
p subsets(["carl"])
p subsets(["carl", "jim"])
p subsets(["carl", "jim", "bobby"])

subsets(["carl", "jim", "bobby"]) ==  [
  [],  # Also, a subset of ["carl", "jim"]

  ["carl"], # Also, a subset of ["carl", "jim"]
  ["jim"],  # Also, a subset of ["carl", "jim"]
  ["bobby"], # [] + ["bobby"]

  ["carl", "jim"],  # Also, a subset of ["carl", "jim"]
  ["carl", "bobby"], # ["carl"] + ["bobby"]
  ["jim", "bobby"], # ["jim"] + ["bobby"]

  ["carl", "jim", "bobby"]
]

# Either a subset of ["carl", "jim"]
# It's a subset of ["carl", "jim"] + "bobby"
#
subsets(["carl", "jim"]) ==  [
  [],

  ["carl"],
  ["jim"],

  ["carl", "jim"]
]