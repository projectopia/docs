FROM squidfunk/mkdocs-material:latest

# Install bash
RUN \
  apk upgrade --update-cache -a && \
  apk add --no-cache bash curl && \
  chsh -s /bin/bash

# Install starship with pure prompt
RUN \
  sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes && \
  echo 'starship preset pure-preset -o ~/.config/starship.toml' >> ~/.bashrc && \
  echo 'eval "$(starship init bash)"' >> ~/.bashrc