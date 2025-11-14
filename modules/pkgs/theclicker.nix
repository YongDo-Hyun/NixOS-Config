{ lib, rustPlatform, fetchurl, ... }:

rustPlatform.buildRustPackage rec {
  pname = "theclicker";
  version = "0.1.2";

  # crates.io göre kaynak indiriliyor
  src = fetchurl {
    url = "https://crates.io/api/v1/crates/theclicker/${version}/download";
    sha256 = "sha256-24yxvvIINycFrkc4S9JevjyxihiwbWgrhFriJ4xSaTw=";
  };

  unpackPhase = ''
    mkdir source
    cd source
    tar xf $src
  '';

  sourceRoot = "source";

  cargoHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==";

  meta = with lib; {
    description = "Simple autoclicker crate";
    homepage = "https://crates.io/crates/theclicker";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
