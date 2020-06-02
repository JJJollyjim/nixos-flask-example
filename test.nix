{ pkgs ? import <nixpkgs> {} }:
let
  lib = pkgs.lib;
in
pkgs.nixosTest
  {
    name = "paste";

    machine = {
      imports = [ ./service.nix ];
      services.paste = {
        enable = true;
      };
    };

    testScript = ''
      start_all()
      machine.wait_for_unit("paste.service")
      machine.wait_for_open_port(8080)

      machine.succeed("curl -fvvv localhost:8080 | grep -q Hello")
    '';
  }
