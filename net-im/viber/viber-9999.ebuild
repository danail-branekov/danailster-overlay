# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"
inherit unpacker xdg-utils

DESCRIPTION="Free calls, text and picture sharing with anyone, anywhere!"
HOMEPAGE="http://www.viber.com"
SRC_URI="
	amd64? ( http://download.cdn.viber.com/cdn/desktop/Linux/viber.deb -> ${P}.deb )
"

IUSE="+bluray +libsoxr +openmpt +speex +theora +twolame +zvbi"
SLOT="0"
KEYWORDS="amd64"

QA_PREBUILT="*"

RESTRICT="mirror bindist strip"

RDEPEND=""

DEPEND="$RDEPEND
        media-libs/opus
        app-arch/snappy
        x11-libs/tslib
        media-video/ffmpeg[bluray?,libsoxr?,openmpt?,speex?,theora?,twolame?,zvbi?]
        media-libs/tiff
        sys-process/numactl
        virtual/opencl
        dev-libs/libxml2-compat
        media-libs/jbigkit"

S="${WORKDIR}"

src_unpack() {
	unpack_deb ${A}
}

src_install(){
	doins -r opt usr
	mv ${ED}/opt/${PN}/Viber ${ED}/opt/${PN}/${PN}-bin
	insinto opt/${PN}
	doins "${FILESDIR}/${PN}"
	fowners root:audio /opt/${PN}/${PN} /opt/${PN}/${PN}-bin
	fperms 755 /opt/${PN}/${PN} /opt/${PN}/${PN}-bin
	sed -i -e '/^Exec/s/Viber/viber/' ${ED}/usr/share/applications/viber.desktop
	fperms 755 /opt/${PN}/libexec/QtWebEngineProcess

  # Remove the bundled libtiff so Viber falls back to the system one
  rm "${ED}/opt/viber/lib/libtiff.so.5" || die
  rm "${ED}/opt/viber/plugins/imageformats/libqtiff.so" || die
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
