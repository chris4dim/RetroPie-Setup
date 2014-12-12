rp_module_id="gngeopi"
rp_module_desc="NeoGeo emulator GnGeoPi"
rp_module_menus="2+"

function depends_gngeopi() {
    rps_checkNeededPackages libsdl1.2-dev
}

function sources_gngeopi() {
    gitPullOrClone "$md_build" https://github.com/ymartel06/GnGeo-Pi.git
}

function build_gngeopi() {
    cd gngeo
    chmod +x configure
    ./configure --disable-i386asm --prefix="$md_inst"
    make clean
    make
}

function install_gngeopi() {
    cd gngeo
    make install
    mkdir -p "$md_inst/neogeobios"
    require="$md_inst/bin/gngeo"
}

function configure_gngeopi() {
    mkdir -p "$romdir/neogeo-gngeopi"

    setESSystem "NeoGeo" "neogeo-gngeopi" "~/RetroPie/roms/neogeo-gngeopi" ".zip .ZIP .fba .FBA" "$md_inst/bin/gngeo -i $romdir/neogeo-gngeopi -B $md_inst/neogeobios %ROM%" "neogeo" "neogeo"
}
