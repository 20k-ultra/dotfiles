#/bin/sh

VERSION=stable

# Use default version
rustup default $VERSION

# Install toolchain
rustup toolchain install $VERSION

# Test install
rustc -V

# Install necessary tools
cargo install sccache
