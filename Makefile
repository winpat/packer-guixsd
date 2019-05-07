.PHONY: iso

iso:  ## Download GuixSD iso
	mkdir -p isos
	wget -P isos https://ftp.gnu.org/gnu/guix/guix-system-install-1.0.0.x86_64-linux.iso.xz
	xz -v -d isos/guix-system-install-1.0.0.x86_64-linux.iso.xz

build:  ## Build GuixSD image
	packer build guixsd_1.0.0.json
