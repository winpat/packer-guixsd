# Packer GuixSD Template
This is a [Packer](https://www.packer.io) template to build QCOW2 [GuixSD](https://www.gnu.org/software/guix/) images.

## Usage
1. To build an image you need download the GuixSD ISO first. Since the ISO is xz
compressed Packer can not automatically do this for you. However there is a
make target to do this:
``` shell
$ make iso
```
2. To build an image simply call:

``` shell
$ make build
```

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
