FROM alpine:edge

RUN apk add git nodejs neovim ripgrep alpine-sdk --update
RUN mkdir -p ~/.config/nvim/ && mkdir -p ~/.local/share/nvim/
COPY init.lua /root/.config/nvim/
RUN nvim --headless -c 'autocmd User PackerComplete qa'
CMD nvim -c  'call timer_start(1000, { tid -> execute("Workspace Terminal Focus") })' -c 'call timer_start(2000, { tid -> execute("Workspace RightPanelToggle") })'

