FROM debian:12-slim

# Release Packages & Licenses
# asdf:       https://github.com/asdf-vm/asdf/releases          - https://github.com/asdf-vm/asdf/blob/master/LICENSE
# k9s:        https://github.com/derailed/k9s/releases          - https://github.com/derailed/k9s/blob/master/LICENSE
# kind:       https://github.com/kubernetes-sigs/kind/releases  - https://github.com/kubernetes-sigs/kind/blob/main/LICENSE
# kube-ps1:   https://github.com/jonmosco/kube-ps1/releases     - https://github.com/jonmosco/kube-ps1/blob/master/LICENSE

# VERSIONS
ENV \
    ASDF_VERSION=v0.14.0 \
    K9S_VERSION=v0.32.5 \
    KUBE_PS1_VERSION=v0.9.0

# Install essential packages
RUN apt-get update && \
    apt-get install -y \
    bash-completion \
    curl \
    dnsutils \
    git \
    gnupg \
    lsb-release \
    make \
    nano \
    sudo \
    # k8s stuff
    kubecolor \
    # enable bash completion
    && echo ". /etc/bash_completion" >> ~/.bashrc

# kubernetes stuff-ps1
RUN \
  # kube-ps1 (aka: where am i?)
  git clone https://github.com/jonmosco/kube-ps1.git $HOME/.kube_ps1 --branch ${KUBE_PS1_VERSION} \
  && echo '. "$HOME/.kube_ps1/kube-ps1.sh"' >> ~/.bashrc \
  && echo "PS1='[\u@\h \W \$(kube_ps1)]\\$ '" >> ~/.bashrc

# Install `asdf` version manager
RUN \
  git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch ${ASDF_VERSION} \
  && echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc \
  && echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc
