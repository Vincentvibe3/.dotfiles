stack clean
stack build
BUILD_LOCATION="$(stack path --local-install-root)/bin/kmonad"
sudo cp $BUILD_LOCATION /usr/local/bin/
echo "kmonad installed to /usr/local/bin"
