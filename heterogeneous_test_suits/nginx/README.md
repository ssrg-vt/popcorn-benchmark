## Build Nginx for Popcorn Linux using natively built popcorn-compiler
1) Compilation
    To build the heterogeneous nginx project , just "./myconfig.sh" on root folder will suffice.
    The binaries are generated in obj folder.
    
    We have everything in place to compile and get the binaries.Binaries are generated in src folder. 

2) Testing Copy the binaries to both x86 and ARM machines. Rename the natives binaries to common name in both machines. Now you can test the functioning.

## Build Nginx using popcorn-compiler docker image
Use the `secure-popcorn` branch of the popcorn compiler, or use the docker image `xgwang9/popcorn-compiler:HeterSec`:
```
❯ cd heterogeneous_test_suits/
❯ docker run --rm \
        -v $(pwd)/nginx:/code/app \
        --user "$(id -u):$(id -g)" \
        xgwang9/popcorn-compiler:HeterSec \
        sh -c 'cd /code/app && ./myconfig.sh'
```