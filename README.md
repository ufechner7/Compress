# Compress
Example code for compressing and decompressing files

## Example
Execute:
```julia

const filename=joinpath("data", "log_8700W_8ms.csv")

input = filename * ".xz"
output = filename
decompress(input, output)
```
to decompress the example file.

Execute:
```julia
using Compress

const filename=joinpath("data", "log_8700W_8ms.csv")

input = filename 
output = filename * ".xz"
compress(input, output; force=false)
```
to compress the uncompressed example file.

The parameter `force=false` means that the output file will not
be overwritten if it already exists.
