# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"
inherit eutils unpacker xdg-utils

DESCRIPTION="Free calls, text and picture sharing with anyone, anywhere!"
HOMEPAGE="http://www.viber.com"
SRC_URI="
	amd64? ( http://download.cdn.viber.com/cdn/desktop/Linux/viber.deb -> ${P}.deb )
"

IUSE="+pulseaudio"
SLOT="0"
KEYWORDS="amd64"

QA_PREBUILT="*"

RESTRICT="mirror bindist strip"
RDEPEND="pulseaudio? ( media-sound/pulseaudio )
	!pulseaudio? ( media-sound/apulse )"

DEPEND="$RDEPEND
        media-libs/opus
        app-arch/snappy
        x11-libs/tslib"

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
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
