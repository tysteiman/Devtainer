FROM alpine

RUN apk add nodejs \
            # ruby \
            # ruby-dev \
            php \
            neovim \
            tmux \
            fzf \
            ripgrep \
            npm \
            git \
            make \
            gcc \
            libc-dev \
            build-base \
            openssh

RUN ln -s /usr/bin/nvim /usr/local/bin/vim

RUN npm install -g intelephense \
                   typescript \
                   typescript-language-server \
                   dockerfile-language-server-nodejs

# RUN gem install solargraph

WORKDIR /root

RUN git clone https://github.com/tysteiman/dot && \
    cp ~/dot/.gitignore ~/ && \
    cp ~/dot/.gitconfig ~/ && \
    mkdir -p ~/.config/nvim && \
    cp -r ~/dot/.config/nvim/* ~/.config/nvim && \
    rm -rf ~/dot

# install packer
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim && \
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

RUN git config --global --add safe.directory /code

# USER 1000:1000

WORKDIR /code

