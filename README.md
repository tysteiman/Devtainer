# Docker Development Image

This is what I use for portable development environments with Docker.

This will install neovim, ruby, php, and many other packages, including LSP suppport for neovim.

# Setup

    git clone https://github.com/tysteiman/Devtainer
    cd Devtainer
    docker build -t devtainer .

# Running

    docker run --rm -it -v $(pwd):/code devtainer sh
