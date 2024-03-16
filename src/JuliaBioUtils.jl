module JuliaBioUtils

using Comonicon , DataFrames, CSV, BioStructures

include("commands/getpdb.jl")
include("commands/batchdownload.jl")

@main

end
