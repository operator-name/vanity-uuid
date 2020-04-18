# What is this?

[UUIDs (or GUIDs)](https://en.wikipedia.org/wiki/Universally_unique_identifier) are quite commonly used from [filesystems](https://en.wikipedia.org/wiki/GUID_Partition_Table) to [databases](https://docs.microsoft.com/en-us/sql/t-sql/data-types/uniqueidentifier-transact-sql?view=sql-server-2017). Instead of relying on [`uuidgen`](https://packages.debian.org/sid/uuid-runtime) to generate unreadable garbage such as `2acb01ee-885a-43a0-922e-9b34360082f4`, why not bend the spec a little (or a lot) and generate instantly memorable and somewhat readable V4 UUIDs such as `b00571ng-j1nx-41nk-a1b1-a77rac71ng1y`?

Just clone this repository or download the release and run `./vanity-uuid{4,-nospec}-arx` today! *Note: running arx is something like x6 slower.* 

## Development

* Install [`nix`](https://nixos.org/nix/).  
* Basically everything is in [default.nix](./default.nix), because this repo is basically a practice for understanding `nixpkgs`.  
* Create single file binaries that are [supposedly 100% crossplatform](https://github.com/matthewbauer/nix-bundle) using:
    * `nix-build -A vanity-uuid4-arx && cp $(readlink result) vanity-uuid4-arx`
    * `nix-build -A vanity-uuid-nospec-arx && cp $(readlink result) vanity-uuid-nospec-arx`

## "Inspiration"

* https://github.com/mattbaker/git-vanity-sha
* https://github.com/exploitagency/vanitygen-plus