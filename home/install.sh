RLS_CODE_NAME=$(lsb_release -cs)

check_is_sudo() {
  if [ "$EUID" -ne 0 ]; then
    echo "Please run as root."
    exit
  fi
}

# Installs the basics
base() {
  apt-get update
  apt-get upgrade -y

  apt-get install \
      apt-transport-https \
      curl \
      ca-certificates \
      git \
      openvpn \
      vim \
      zsh

   # set zsh as default shell
   chsh -s $(which zsh)
}

# Installs
scripts() {
  # oh-my-zsh
  curl -sSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

  # FIXME pip oneliner installation
  #curl -sSL https://bootstrap.pypa.io/get-pip.py | sh
}

install_docker() {


}

# install/update golang from source
install_golang() {
  export GO_VERSION=1.7.0
  export GO_SRC=/usr/local/go

  # if we are passing the version
  if [[ ! -z "$1" ]]; then
    export GO_VERSION=$1
  fi

  # purge old src
  if [[ -d "$GO_SRC" ]]; then
    sudo rm -rf "$GO_SRC"
    sudo rm -rf "$GOPATH"
  fi

  # subshell because we cd
  (
  curl -sSL "https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz" | sudo tar -v -C /usr/local -xz
  )

  # get commandline tools
  (
  set -x
  set +e
  go get github.com/golang/lint/golint
  go get golang.org/x/tools/cmd/cover
  go get golang.org/x/review/git-codereview
  go get golang.org/x/tools/cmd/goimports
  go get golang.org/x/tools/cmd/gorename
  go get golang.org/x/tools/cmd/guru
  )
}

# add docker gpg key
apt-key adv —keyserver hkp://p80.pool.sks-keyservers.net:80 —recv-keys 58118E89F3A912897C070ADBF76221572C52609D

usage() {
    echo -e "install.sh\n\tThis script installs the basic setup of Ubuntu based distro's I use."
    echo "Usage:"
    echo "  sources                     - setup sources & install base pkgs"
    echo "  graphics {dell,mac,lenovo}  - install graphics drivers"
    echo "  wm                          - install window manager/desktop pkgs"
    echo "  dotfiles                    - get dotfiles"
    echo "  golang                      - install golang and packages"
}
