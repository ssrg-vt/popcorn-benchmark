## Build Nginx for Popcorn Linux using natively built popcorn-compiler
1) Compilation
    To build the heterogeneous nginx project , just "./myconfig.sh" on root folder will suffice.
    The binaries are generated in obj folder.
    
    We have everything in place to compile and get the binaries.Binaries are generated in src folder. 

2) Testing Copy the binaries to both x86 and ARM machines. Rename the natives binaries to common name in both machines. Now you can test the functioning.

## Build Nginx using popcorn-compiler docker image
### Build Redis using Popcorn Compiler LLVM 9 (Default)
Switch to the `main` branch of the popcorn compiler, use command `./build_nginx_popcorn.sh` inside the Nginx root directory.
Or use the docker image `xgwang9/popcorn-compiler:main`:
```
❯ cd heterogeneous_test_suits/nginx
❯ docker run --rm \
        -v $(pwd):/code/app \
        --user "$(id -u):$(id -g)" \
        xgwang9/popcorn-compiler:main \
        sh -c 'cd /code/app && ./build_nginx_popcorn.sh'
```
### Build Redis using Popcorn Compiler LLVM 3.7
Switch to the `secure-popcorn` branch of the popcorn compiler, use command `./build_nginx_popcorn.sh LLVM=3.7` inside the Nginx root directory.
Or use the docker image `xgwang9/popcorn-compiler:HeterSec`:
```
❯ cd heterogeneous_test_suits/nginx
❯ docker run --rm \
        -v $(pwd):/code/app \
        --user "$(id -u):$(id -g)" \
        xgwang9/popcorn-compiler:HeterSec \
        sh -c 'cd /code/app && ./build_nginx_popcorn.sh LLVM=3.7'
```