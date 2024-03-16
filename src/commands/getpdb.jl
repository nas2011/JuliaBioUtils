using BioStructures
"""
Download the PDB file for a given PDB id. Returns the DataFrame.

# Args
- `id`: PDB id

# Options
- `-o, --outDir=<arg>`: Location to save the file.
- `-f, --format=<arg>`: PDB, PDBXML, mmCIF, or MMTF. Default = PDB
"""
@cast function getpdb(id::String;outDir::String = pwd(),format::String="PDB")
    fmtMap = Dict(
        "PDB" => PDB,
        "PDBXML" => PDBXML,
        "MMCIF" => MMCIF,
        "MMTF" => MMTF,    
    )
    fmt = fmtMap[format]
    downloadpdb(id,dir=outDir,format=fmt)
    ext = pdbextension[fmt]
    f = "$(id).$(ext)"
    fpath = joinpath(outDir,f)
    struc = read(fpath,fmt)
    println(struc)
    DataFrame(collectatoms(struc))
end