{ pythonPackages ? (import <nixpkgs> {}).python3Packages }:
with pythonPackages;
buildPythonPackage {
  name = "paste";
  src = ./paste;

  propagatedBuildInputs = [ flask ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/${python.sitePackages}
    cp -r . $out/${python.sitePackages}/paste

    runHook postInstall
  '';

  shellHook = "export FLASK_APP=paste";

  format = "other";
}
