using BioStructures, CSV, DataFrames
"""
Batch download PDB files 

# Args
- `file`: Source file with list of PDBs to download including a header titled PDB

# Options
- `-d, --delim=<arg>`: Delimiter used in source file. Default is ","
- `-o, --outDir=<arg>`: Location to save the file. Default is current directory.
"""
@cast function batchdownload(src::String;outDir::String = pwd(),delim::String=",")
    data = CSV.read(src,DataFrame,select=(i,nm)->uppercase(String(nm))=="PDB")
    data = rename(data,uppercase.(names(data)))
    @assert in("PDB",names(data)) "Must have a column titled PDB"
    ids = data.PDB
    downloadpdb(ids,dir=outDir)
end
