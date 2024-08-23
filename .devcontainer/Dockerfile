FROM debian:12-slim

# Release Packages & Licenses
# asdf:       https://github.com/asdf-vm/asdf/releases          - https://github.com/asdf-vm/asdf/blob/master/LICENSE
# helm:       https://github.com/helm/helm/releases             - https://github.com/helm/helm/blob/main/LICENSE
# k9s:        https://github.com/derailed/k9s/releases          - https://github.com/derailed/k9s/blob/master/LICENSE
# kind:       https://github.com/kubernetes-sigs/kind/releases  - https://github.com/kubernetes-sigs/kind/blob/main/LICENSE
# kube-ps1:   https://github.com/jonmosco/kube-ps1/releases     - https://github.com/jonmosco/kube-ps1/blob/master/LICENSE
# minikube:   https://github.com/kubernetes/minikube            - https://github.com/kubernetes/minikube/blob/master/LICENSE
# pre-commit: https://github.com/pre-commit/pre-commit          - https://github.com/pre-commit/pre-commit/blob/main/LICENSE

# VERSIONS
ENV \
    ASDF_VERSION=v0.14.0 \
    HELM_VERSION=v3.15.0 \
    K9S_VERSION=v0.32.5 \
    KUBE_PS1_VERSION=v0.9.0 \
    KUBERNETES_VERSION=v1.30.4 \
    MINIKUBE_VERSION=v1.33.1 \
    PRE_COMMIT_VERSION=3.8.0

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
    python3 python3-pip \
    # k8s stuff
    kubecolor \
    kubectx \
    # for zbctl
    nodejs \
    npm \
    # enable bash completion
    && echo ". /etc/bash_completion" >> ~/.bashrc

# kubernetes stuff-ps1
RUN \
  # kubectl
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" && \
  curl -LO "https://dl.k8s.io/release/${KUBERNETES_VERSION}/bin/linux/${ARCH}/kubectl" \
  && curl -LO "https://dl.k8s.io/${KUBERNETES_VERSION}/bin/linux/${ARCH}/kubectl.sha256" \
  && echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check \
  && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
  && kubectl version --client --output=yaml \
  && echo "source <(kubectl completion bash)" >> ~/.bashrc \
  && rm -rf kubectl* \
  # kubecolor & k
  && echo "alias kubectl=kubecolor" >> ~/.bashrc \
  && echo "alias k=kubectl" >> ~/.bashrc \
  # kube-ps1 (aka: where am i?)
  && git clone https://github.com/jonmosco/kube-ps1.git $HOME/.kube_ps1 --branch ${KUBE_PS1_VERSION} \
  && echo '. "$HOME/.kube_ps1/kube-ps1.sh"' >> ~/.bashrc \
  && echo "PS1='[\u@\h \W \$(kube_ps1)]\\$ '" >> ~/.bashrc \
  # k9s
  && curl -sS https://webinstall.dev/k9s | bash \
  # Helm
  && curl https://raw.githubusercontent.com/helm/helm/${HELM_VERSION}/scripts/get-helm-3 | bash \
  && helm version \
  # Minikube
  && curl -LO "https://storage.googleapis.com/minikube/releases/${MINIKUBE_VERSION}/minikube_latest_${ARCH}.deb" \
  && sudo dpkg -i "minikube_latest_${ARCH}.deb" \
  && minikube version

# Install `asdf` version manager
RUN \
  git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch ${ASDF_VERSION} \
  && echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc \
  && echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc

# Pip Dependencies
RUN pip install \
  pre-commit==${PRE_COMMIT_VERSION} \
  --break-system-packages && pre-commit -V

# zbctl
RUN \
  npm i -g zbctl
