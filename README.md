🚀 FTP Mirror
===================================

Syncs a local folder with a remote folder over FTP using GitHub Workflow.

## :clipboard: Usage

Create custom workflow for your project as per [this doc][1].
Read more about Encrypted Secrets [here][2].


```yaml
name: 🚀 Deploy
on:
  push:
    branches: [ master ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      # Here is the deployment action
      - name: Upload from output to a remote server via FTP
        uses: modern-dev/ftp-mirror@latest
        with:
          server: ${{ secrets.FTP_SERVER }}
          user: ${{ secrets.FTP_USERNAME }}
          password: ${{ secrets.FTP_PASSWORD }}
          local_dir: "./output"
          delete: "false"
          exlude: "data/ cache/"
```

## :wrench: Settings


Option | Description | Required | Default | Example
---    | ---         | ---      | ---     | ---
server | FTP Server. | Yes | N/A | ftp.myserver.com
user | FTP Username. | Yes | N/A | admin@myserver.com
password | FTP Password. | Yes | N/A | mystrongpassword
local_dir | Local directory. | No | "./" | "./public_html"
remote_dir | Remote directory. | No | "./" | "/www/user/home"
delete | Delete all the files inside of the remote directory before the upload process. | No | false | N/A
exclude | Exclude matching files. | No | "" | "data/ cache/"
exclude_glob | Exclude matching files using glob pattern. | No | "" | "*.bak"
max_retries | Times that the `lftp` will be executed if an error occurred. | No | 10 | N/A
no_symlinks | Do not create symbolic links. | No | true | N/A
ftp_ssl_allow | FTP - Allow SSL encryption | No | false | N/A
ftp_use_feat | FTP - FEAT: Determining what extended features the FTP server supports. | No | false | N/A
ftp_nop_interval | FTP - Delay in seconds between NOOP commands when downloading tail of a file. | No | 2 | N/A
net_max_retries | NET - Maximum number of operation without success.<br> 0 unlimited.<br> 1 no retries. | No | 1 | N/A
net_persist_retries | NET - Ignore hard errors.<br> When reply 5xx errors or there is too many users. | No | 5 | N/A
net_timeout | NET - Sets the network protocol timeout. | No | 15s | N/A
dns_max_retries | DNS - 0 no limit trying to lookup an address otherwise try only this number of times. | No | 8 | N/A
dns_fatal_timeout | DNS - Time for DNS queries.<br> Set to "never" to disable. | No | 10s | N/A

More information in the official site for [lftp - Manual pages][3]

## :green_book: License

[Licensed under the MIT license.](https://github.com/modern-dev/ftp-mirror/blob/master/LICENSE)

Copyright (c) 2022 Bohdan Shtepan

---

> [modern-dev.com](https://modern-dev.com) &nbsp;&middot;&nbsp;
> GitHub: [@virtyaluk](https://github.com/virtyaluk) &nbsp;&middot;&nbsp;
> Twitter: [@virtyaluk](https://twitter.com/virtyaluk)

[1]: https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions
[2]: https://docs.github.com/en/actions/security-guides/encrypted-secrets
[3]: https://linux.die.net/man/1/lftp