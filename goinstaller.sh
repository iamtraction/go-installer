#!/bin/bash

GOVERSION=1.13.4

GOROOT="$HOME/go"

if [ ! -f "$GOROOT/bin/go" ]; then
  echo "Installing Go..."

  _GO_ARCHIVE="$HOME/go.tar.gz"

  if [[ "$(uname)" =~ .*[Dd]arwin.* ]]; then
    curl -o "$_GO_ARCHIVE" https://dl.google.com/go/go${GOVERSION}.darwin-amd64.tar.gz
  else
    curl -o "$_GO_ARCHIVE" https://dl.google.com/go/go${GOVERSION}.linux-amd64.tar.gz
  fi

  rm -rf "$GOROOT" &>/dev/null
  tar -xzf "$_GO_ARCHIVE" -C "$HOME"
fi

GOPATH=$GOROOT
PATH="$PATH:$GOROOT/bin"

echo >> ~/.bashrc
echo "# set environment variables for Go if it exists." >> ~/.bashrc
echo 'if [ -d "$HOME/go/bin" ] ; then' >> ~/.bashrc
echo "    GOROOT=\"$GOROOT\"" >> ~/.bashrc
echo '    GOPATH="$GOROOT"' >> ~/.bashrc
echo '    PATH="$PATH:$GOROOT/bin"' >> ~/.bashrc
echo "fi" >> ~/.bashrc

echo "Successfully installed Go!"
