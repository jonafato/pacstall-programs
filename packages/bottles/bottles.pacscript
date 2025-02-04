name="bottles"
version="2022.5.2-trento-3"
description="Easily manage wine and proton prefix"
repology=("project: bottles")
url="https://github.com/bottlesdevs/Bottles/archive/${version}.tar.gz"
hash="66b681fd2542feb229e9f2b346d6affea96319d0dcc922d90b8da16651ef06bf"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="${name}"
breaks="${name} ${name}-deb ${name}-app ${name}-git com.github.mirkobrombin.bottles"

depends="gir1.2-gtksource-4 libgtksourceview-4-0 libgtksourceview-4-common libgtksourceview-4-dev libgtk-3-0 hicolor-icon-theme libdconf1 libdconf-dev libhandy-1-0 libhandy-1-dev gir1.2-handy-1 gnutls-bin python3 python3-gi patool p7zip-full python3-markdown python3-requests python3-yaml cabextract x11-utils libwebkit2gtk-4.0-dev libwebkit2gtk-4.0-37 libglib2.0-dev wine gettext"
optdepends=("gamemode: Increase Performance"
	    "libvulkan1: Add vulkan support"
	    "libvkd3d1: Vulkan to Directx (normally installed by wine)"
	    "gvfs: virtual filesystem")
build_depends="meson ninja-build cmake"

prepare() {
    true
}

build() {
    # remove icons from build as it makes stow angry due to it being symlinked
    sudo sed -i '43,66d' data/meson.build
    sudo sed -i "/dependency('libhandy-1', version: '>= 1.5')/c\dependency('libhandy-1', version: '>= 1.0.0')" src/meson.build

    sudo meson --prefix='/usr' build
    sudo ninja -C build
}

install() {
    # install icons manually via copying
    sudo mkdir -p "${STOWDIR}/${name}/usr/share/icons/hicolor/48/apps"
    sudo cp data/icons/hicolor/48/apps/*.svg "${STOWDIR}/${name}/usr/share/icons/hicolor/48/apps"

    sudo mkdir -p "${STOWDIR}/${name}/usr/share/icons/hicolor/scalable/apps"
    sudo cp data/icons/hicolor/scalable/apps/*.svg "${STOWDIR}/${name}/usr/share/icons/hicolor/scalable/apps"

    # Install bottles
    sudo DESTDIR="${STOWDIR}/${name}" ninja -C build install

}
