using BioStructures
"""
Download the PDB file for a given PDB id

# Args
- `id`: PDB id

# Options
- `-o, --outDir=<String>`: Location to save the file.
"""
@cast function getPDB(id::String;outDir::String = pwd())
    fname = id * ".pdb"
    fpath = joinpath(outDir,fname)
    downloadpdb(id,dir=fpath)
end
