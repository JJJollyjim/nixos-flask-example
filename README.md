# Example flask nixos setup

## Development

`nix-shell` will import `default.nix`, bringing the app's dependencies (just flask) into scope, as well as setting `FLASK_APP`:

```
~/nixos-flask-example ❯❯❯ nix-shell
Sourcing python-remove-tests-dir-hook
Sourcing python-catch-conflicts-hook.sh
Sourcing python-remove-bin-bytecode-hook.sh
Sourcing python-imports-check-hook.sh
Using pythonImportsCheckPhase
Sourcing python-namespaces-hook

[nix-shell:~/nixos-flask-example]$ flask run
 * Serving Flask app "paste"
```

## Production

Add `service.nix` to your NixOS configuration's `imports`, and enable `services.paste`.

This will run the package from `default.nix` under waitress-serve.

## Testing

`nix-build test.nix`
