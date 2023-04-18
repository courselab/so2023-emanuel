[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-718a45dd9cf7e7f842a935f5ebbe5719a5e09af4491e668f4dbf3b35d5cca122.svg)](https://classroom.github.com/online_ide?assignment_repo_id=10881907&assignment_repo_type=AssignmentRepo)
# Simple bootloader
It just prints:

```sh
Booting..
Hello Word!
```

and exit (halt)!

## Build

```sh
make
```
## Testing
```sh
qemu-system-i386  -drive format=raw,file=bootloader.bin -net none 
```

## Building using docker
- Building the docker image
```sh
docker build -t so .
``` 

- Running (i.e., assembly and link the bootloader)
```sh
./make.sh
``` 

- Testing (using qemu)
```sh
make test # or
qemu-system-i386 -nographic -drive format=raw,file=bootloader.bin -net none 
```


