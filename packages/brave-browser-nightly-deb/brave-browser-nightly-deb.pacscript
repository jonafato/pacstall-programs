name="brave-browser-nightly-deb"
version="1.40.57"
gives="brave-browser-nightly"
breaks="${gives}-bin ${gives}-app ${gives}-git"
replace="${gives}"
url="https://github.com/brave/brave-browser/releases/download/v${version}/${gives}_${version}_amd64.deb"
description="The Brave browser is a fast, private and secure web browser for PC, Mac and mobile. This is the nightly build of Brave Browser"
hash="cd6cd38de96888b0b16a62f252002d3739eeb1cf6fde75a6cd7f118a319a5372"
repology=("project: brave" "visiblename: brave-nightly")
maintainer="TwilightBlood <hwengerstickel@pm.me>"
