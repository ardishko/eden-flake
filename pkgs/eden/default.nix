{
  fetchurl,
  stdenv,
  lib,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "eden";
  version = "0.2.0-rc1";

  src = fetchurl {
    url = "https://github.com/eden-emulator/Releases/releases/download/v${finalAttrs.version}/Eden-Linux-v${finalAttrs.version}-amd64-clang-pgo.AppImage";
    sha256 = "sha256-WB+UcqaW/Gf2STA8E8vCwi6EScPrdSIrje0V5xPW65Q=";
  };

  desktopItem = fetchurl {
    url = "https://git.eden-emu.dev/eden-emu/eden/raw/tag/v${finalAttrs.version}/dist/dev.eden_emu.eden.desktop";
    sha256 = "sha256-GfVkDT1vrgmgqCcI4vjI6cqPA6JkVUu8BNZRh5Yvq+U=";
  };

  desktopIcon = fetchurl {
    url = "https://git.eden-emu.dev/eden-emu/eden/raw/tag/v${finalAttrs.version}/dist/dev.eden_emu.eden.svg";
    sha256 = "sha256-tiGRacrAUXPpbIF0eW3Jku1EvGjNLY4FOd4KrCy5XWk=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share/applications
    mkdir -p $out/share/icons/hicolor/scalable/apps

    cp $src $out/bin/eden
    chmod +x $out/bin/eden

    cp $desktopItem $out/share/applications/dev.eden_emu.eden.desktop
    cp $desktopIcon $out/share/icons/hicolor/scalable/apps/dev.eden_emu.eden.svg
  '';

  meta = {
    description = "Eden Nintendo Switch Emulator";
    homepage = "https://eden-emu.dev/";
    license = lib.licenses.gpl3;
    maintainers = [ ];
    platforms = lib.platforms.linux;
    mainProgram = "eden";
  };
})
