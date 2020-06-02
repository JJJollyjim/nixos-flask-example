{ lib, pkgs, config, ... }:
let
  cfg = config.services.paste;
  appEnv = pkgs.python3.withPackages (p: with p; [ waitress (callPackage ./default.nix {}) ]);
in {
  options.services.paste = {
    enable = lib.mkEnableOption "paste";

    # TODO more options
  };

  config = lib.mkIf cfg.enable {
    systemd.services.paste = {
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        ExecStart = "${appEnv}/bin/waitress-serve paste:app";

        # TODO harden :P
      };
    };
  };
}
