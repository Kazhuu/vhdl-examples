from vunit import VUnit

vu = VUnit.from_argv()
lib = vu.add_library('lib')
lib.add_source_files("components/arithmetic/array-multiplier/*.vhd")
vu.main()