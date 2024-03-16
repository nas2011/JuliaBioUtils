using BioStructures
"""
Download the PDB file for a given PDB id.

# Args
- `id`: PDB id

# Options
- `-o, --outDir=<arg>`: Location to save the file.
- `-f, --format=<arg>`: PDB, PDBXML, mmCIF, or MMTF. Default = PDB

# Flags
- `-a, --all`: Show all rows of the resulting PDB table. Default is first 10 rows.
"""
@cast function getpdb(id::String;outDir::String = pwd(),format::String="PDB",all::Bool=false)
    id = uppercase(id)
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
    df = DataFrame(collectatoms(struc))
    if all
        display(df)
    else
        display(df[1:10,:])
    end
end