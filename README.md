# What is this?

[UUIDs (or GUIDs)](https://en.wikipedia.org/wiki/Universally_unique_identifier) are quite commonly used from [filesystems](https://en.wikipedia.org/wiki/GUID_Partition_Table) to [databases](https://docs.microsoft.com/en-us/sql/t-sql/data-types/uniqueidentifier-transact-sql?view=sql-server-2017). Instead of relying on [`uuidgen`](https://packages.debian.org/sid/uuid-runtime) to generate unreadable garbage such as `2acb01ee-885a-43a0-922e-9b34360082f4`, why not bend the spec a little and generate instantly memorable and somewhat readable V4 UUIDs such as `b00571ng-j1nx-41nk-a1b1-a77rac71ng1y`?

Just clone this repository and run `./vanity-uuid4.sh` today!

## "Insparation"

* https://github.com/mattbaker/git-vanity-sha
* https://github.com/exploitagency/vanitygen-plus