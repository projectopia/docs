FROM mcr.microsoft.com/vscode/devcontainers/python:3.9

RUN \
  pip install mkdocs-material && \
  sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes && \
  echo 'starship preset pure-preset -o /home/vscode/.config/starship.toml' >> /home/vscode/.bashrc && \
  echo 'eval "$(starship init bash)"' >> /home/vscode/.bashrc

USER vscode
EXPOSE 8000