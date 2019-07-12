from vunit import VUnit

vu = VUnit.from_argv()
lib = vu.add_library('lib')
lib.add_source_files("components-and-cores/arithmetic/array-multiplier/*.vhd")
lib.add_source_files("components-and-cores/adding-cpu/*.vhd")
vu.main()
