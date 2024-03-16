# JuliaBioUtils

[![Build Status](https://github.com/nas2011/JuliaBioUtils.jl/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/nas2011/JuliaBioUtils.jl/actions/workflows/CI.yml?query=branch%3Amaster)

# JuliaBioUtils CLI

## Installation

To start, add the package from the github repo. 

```julia
using Pkg
Pkg.add("https://github.com/nas2011/JuliaBioUtils.jl")
```

The first build is going to be slow as everything is compiling. There are a few large dependencies that I preemptively included as they will be used for future functionality.

The package will run through the build and precompile. Once that is done, use the package and run the install

```julia
using JuliaBioUtils
JuliaBioUtils.comonicon_install()
```

The CLI tool will now be installed in ~/.julia/bin. You can add this to PATH by

```bash
export PATH="~/.julia/bin:$PATH"
```

If you want to permanently add to path, then put the same line above in your .bashrc file

## Use

The CLI tool is accessed using the ```jutils``` command.

To see available commands:

```bash
>jutils -h

  jutils v1.0.0-DEV

Usage

  jutils <command>

Commands

  batchdownload                                             Batch download PDB files

  getpdb                                                    Download the PDB file for a given PDB id.

Flags

  -h, --help                                                Print this help message.
  --version                                                 Print version.
```

To see help for a specific command do

```bash
>jutils getpdb -h

  getpdb <args> [options] [flags]

Args

  <id>                                                      PDB id

Options

  -o, --outDir <arg>                                        Location to save the file.

  -f, --format <arg>                                        PDB, PDBXML, mmCIF, or MMTF. Default = PDB

Flags

  -a, --all                                                 Show all rows of the resulting PDB table. Default is first
                                                            10 rows.

  -h, --help                                                Print this help message.
```

To download a single PDB

```bash
nicks@DESKTOP-L1DPLD7:~$ jutils getpdb 2hbs
[ Info: Downloading file from PDB: 2HBS
ProteinStructure 2HBS.pdb with 1 models, 8 chains (A,B,C,D,E,F,G,H), 1148 residues, 9677 atoms
10×17 DataFrame
 Row │ ishetero  serial  atomname  altlocid  resname  chainid  resnumber  inscode  x        y        z        occupancy  tempfactor  element  charge  modelnumber  isdisorderedatom
     │ Bool      Int64   String    Char      String   String   Int64      Char     Float64  Float64  Float64  Float64    Float64     String   String  Int64        Bool
─────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   1 │    false       1  N                   VAL      A                1            10.39    20.427   13.21         1.0       45.04  N                          1             false
   2 │    false       2  CA                  VAL      A                1            10.59    18.948   13.104        1.0       43.39  C                          1             false
   3 │    false       3  C                   VAL      A                1            12.056   18.656   12.771        1.0       39.8   C                          1             false
   4 │    false       4  O                   VAL      A                1            12.802   19.566   12.422        1.0       41.29  O                          1             false
   5 │    false       5  CB                  VAL      A                1             9.649   18.332   12.032        1.0       45.28  C                          1             false
   6 │    false       6  CG1                 VAL      A                1            10.08    18.742   10.624        1.0       45.97  C                          1             false
   7 │    false       7  CG2                 VAL      A                1             9.596   16.82    12.175        1.0       45.38  C                          1             false
   8 │    false       8  N                   LEU      A                2            12.468   17.396   12.887        1.0       35.63  N                          1             false
   9 │    false       9  CA                  LEU      A                2            13.855   17.027   12.612        1.0       31.33  C                          1             false
  10 │    false      10  C                   LEU      A                2            14.217   17.008   11.138        1.0       29.7   C                          1             false
```

If you need the entire DataFrame you can pass the ```-a``` or ```-all``` flag. You can also select a directory to write to using ```-o <dir>``` or ```--outDir <dir>``` to specify the write out location.

To batch download specify the location of a delimited file with a header of PDB

```bash
nicks@DESKTOP-L1DPLD7:~$ jutils batchdownload a.csv
[ Info: Downloading file from PDB: 1EN2
[ Info: Downloading file from PDB: 1ALW
[ Info: Downloading file from PDB: 1AKE
```

if the delimiter is anything other than “,” then pass the ```-d <delim>``` or ```--delim <delim>``` arguments. As with the getpdb command, batchdownload allows you to specify the write out location using ```-o <dir>``` or ```--outDir <dir>``` .