# updatecli

```
UPDATECLI_ACTION=APPLY
Cloning into 'updatecli'...
Execute updatecli in apply mode

Loading Updatecli compose file: "updatecli-compose.yaml"
One policy detected:
        * Policy: Local Updatecli Policies

Initializing policy: "Local Updatecli Policies"
        manifest: "updatecli.d"
        value: "values.d/bitbucket.yaml"


+++++++++++
+ PREPARE +
+++++++++++

Loading Pipeline "updatecli.d/argo-events.yaml"
Loading Pipeline "updatecli.d/argo-workflows.yaml"
Loading Pipeline "updatecli.d/buf.yaml"
Loading Pipeline "updatecli.d/curl.yaml"
Loading Pipeline "updatecli.d/dex.yaml"
Loading Pipeline "updatecli.d/go.yaml"
Loading Pipeline "updatecli.d/golangci-lint.yaml"
Loading Pipeline "updatecli.d/goreleaser.yaml"
Loading Pipeline "updatecli.d/jfrog-cli.yaml"
Loading Pipeline "updatecli.d/python.yaml"
Loading Pipeline "updatecli.d/sonarqube.yaml"
Loading Pipeline "updatecli.d/sourcegraph.yaml"
Loading Pipeline "updatecli.d/updatecli.yaml"

SCM repository retrieved: 5


++++++++++++++++++
+ AUTO DISCOVERY +
++++++++++++++++++



++++++++++++
+ PIPELINE +
++++++++++++



###############
# ARGO-EVENTS #
###############

source: source#argo-events-version
--------------------------
Searching for version matching pattern "*"
✔ GitHub release version "v1.9.5" found matching pattern "*" of kind "semver"
[transformers]
✔ Result correctly transformed from "v1.9.5" to "1.9.5"


CHANGELOG:
----------

Release published on the 2025-01-10 18:11:20 +0000 UTC at the url https://github.com/argoproj/argo-events/releases/tag/v1.9.5

## Major Changes

- fix: connection for custom gRPC trigger (#3421)
- Bump up Argo Workflow binary to v3.6.2

## Pull Requests

https://github.com/argoproj/argo-events/compare/v1.9.4...v1.9.5

## Installation

```sh
kubectl create namespace argo-events
kubectl apply -n argo-events -f https://github.com/argoproj/argo-events/releases/download/v1.9.5/install.yaml

# Install validating webhook (optional)
kubectl apply -n argo-events -f https://github.com/argoproj/argo-events/releases/download/v1.9.5/install-validating-webhook.yaml
```


target: target#staging-version-kustomize
--------------------------------
✔ - no change detected:
        * key "$.values.argoEvents.version" already set to "1.9.5", from file "clusters/argo-dev/namespaces/cdx-argo/values.yaml"

target: target#production-version-kustomize
-----------------------------------
✔ - no change detected:
        * key "$.values.argoEvents.version" already set to "1.9.5", from file "clusters/argo-prod/namespaces/cdx-argo/values.yaml"


##################
# ARGO-WORKFLOWS #
##################

source: source#argo-workflows-version
-----------------------------
Searching for version matching pattern "3.6.x"
✔ GitHub release version "v3.6.5" found matching pattern "3.6.x" of kind "semver"
[transformers]
✔ Result correctly transformed from "v3.6.5" to "3.6.5"


CHANGELOG:
----------

Release published on the 2025-03-11 08:59:16 +0000 UTC at the url https://github.com/argoproj/argo-workflows/releases/tag/v3.6.5

# Quick Start

## What's New?

Find out on [our blog](https://blog.argoproj.io) and [changelog](https://github.com/argoproj/argo-workflows/blob/main/CHANGELOG.md).

## Breaking Changes and Known Issues

Check the [upgrading guide](https://argo-workflows.readthedocs.io/en/latest/upgrading/) and search for [existing issues on GitHub](https://github.com/argoproj/argo-workflows/issues).

## Installation

### CLI

#### Mac / Linux

Available via `curl`

```bash
# Detect OS
ARGO_OS="darwin"
if [[ uname -s != "Darwin" ]]; then
  ARGO_OS="linux"
fi

# Download the binary
curl -sLO "https://github.com/argoproj/argo-workflows/releases/download/v3.6.5/argo-$ARGO_OS-amd64.gz"

# Unzip
gunzip "argo-$ARGO_OS-amd64.gz"

# Make binary executable
chmod +x "argo-$ARGO_OS-amd64"

# Move binary to path
mv "./argo-$ARGO_OS-amd64" /usr/local/bin/argo

# Test installation
argo version
```

### Controller and Server

```bash
kubectl create namespace argo
kubectl apply -n argo -f https://github.com/argoproj/argo-workflows/releases/download/v3.6.5/install.yaml
```


target: target#staging-version-kustomize
--------------------------------
WARNING: branch "refs/heads/updatecli_main_bf686b8a0da03dff9f9fe022f7bc0d706adcf2adc9025ccb3010f09607b7a904" diverged from "refs/heads/main", resetting it to "refs/heads/main"
⚠ - change detected:
        * key "$.values.argoWorkflows.version" updated from "3.6.4" to "3.6.5", in file "clusters/argo-dev/namespaces/cdx-argo/values.yaml"

target: target#production-version-kustomize
-----------------------------------
⚠ - change detected:
        * key "$.values.argoWorkflows.version" updated from "3.6.4" to "3.6.5", in file "clusters/argo-prod/namespaces/cdx-argo/values.yaml"


#######
# BUF #
#######

source: source#version
--------------
Searching for version matching pattern "*"
✔ GitHub release version "v1.51.0" found matching pattern "*" of kind "semver"
[transformers]
✔ Result correctly transformed from "v1.51.0" to "1.51.0"


CHANGELOG:
----------

Release published on the 2025-03-28 16:19:16 +0000 UTC at the url https://github.com/bufbuild/buf/releases/tag/v1.51.0

- Fix `buf convert` to allow for zero length for `binpb`, `txtpb`, and `yaml` formats.
- Fix use of deprecated flag `--include-types` for `buf generate`.
- Add `--against-registry` flag to `buf breaking` that runs breaking checks against the latest commit on the default branch of the corresponding module in the registry.
- Fix type filter with unused image dependencies for `buf generate`.
- Improve type filtering for `buf generate`. Adds the ability to exclude types with the parameter `exclude_types` in `buf.gen.yaml` and a flag `--exclude-types` in the CLI. Type filters may now also be specified as plugin parameters in `buf.gen.yaml`.

target: target#update-version-build-go
------------------------------
✔ The line #386, matched by the keyword "ENV" and the matcher "BUF_VERSION", is correctly set to "ENV BUF_VERSION=1.51.0".
✔ - changed lines [] of file "/tmp/updatecli/stash/oci-cdx/build-go/.templates/Dockerfile"

target: target#run-make-build-go-repo
-----------------------------


########
# CURL #
########

source: source#version
--------------
Searching for version matching pattern "*"
✔ GitHub release version "8.13.0" found matching pattern "*" of kind "semver"
[transformers]
✔ Result correctly transformed from "8.13.0" to "8.13.0"


CHANGELOG:
----------

Release published on the 2025-04-02 11:45:07 +0000 UTC at the url https://github.com/stunnel/static-curl/releases/tag/8.13.0

# Static cURL 8.13.0 with HTTP3

## Components

- libcurl/8.13.0
- OpenSSL/3.4.1
- zlib/1.3.1
- brotli/1.1.0
- zstd/1.5.7
- c-ares/1.34.4
- libidn2/2.3.8
- libpsl/0.21.5
- libssh2/1.11.1
- nghttp2/1.65.0
- nghttp3/1.8.0

## Protocols

dict file ftp ftps gopher gophers http https imap imaps ipfs ipns mqtt pop3 pop3s rtsp scp sftp smb smbs smtp smtps telnet tftp ws wss

## Features

alt-svc AsynchDNS brotli HSTS HTTP2 HTTP3 HTTPS-proxy IDN IPv6 Largefile libz NTLM PSL SSL SSLS-EXPORT threadsafe TLS-SRP TrackMemory UnixSockets zstd

## License

This binary includes various open-source software such as curl, openssl, zlib, brotli, zstd, libidn2, libssh2, nghttp2, ngtcp2, nghttp3. Their license information has been compiled and is included in the dev package.

## Checksums

| File | Platform | Arch | LibC | SHA256 |
|------|------|------|--------|--------|
| curl | linux | aarch64 | glibc | 4b893e6dff039b92e29e22cc93e9b69aac4281d12c0ac085f24942c3ea6c4508 |
| curl | linux | aarch64 | musl | b75834c93506df0ee5319148959b84d1a6d74a4612cf142e103ace69a6bbc5dc |
| curl | linux | armv5 | glibc | 7277b1ac4d41ec62e27c7873d77d725c3cd0321e79cbec2e84a127dfb41c9b63 |
| curl | linux | armv5 | musl | 4e85cbe908812257b09ff0c9974f32429341f212ab79c2acf41e3697fb5487fc |
| curl | linux | armv7 | glibc | 9beb3e5f63151e8ffbd67da5cceac93beed20ef0f177d51cc37546d552949703 |
| curl | linux | armv7 | musl | f3288e87d5374ed78cf6d17f5522ec0b2c618c34ab6203b527375893f3857343 |
| curl | linux | i686 | glibc | 6044f25cdbd18f837a7cfdc21b4c8bbabfad8cf399247b8111f49738084ca630 |
| curl | linux | loongarch64 | musl | 78be7b2386b743a3fabc0fa894570b5957eca12bc208e7b30396958ace925eff |
| curl | linux | mips | musl | 61aef092c5ac7e58b40dbb0ce8d943fbcc0c74898b9308c1285736de693adeda |
| curl | linux | mips64 | glibc | 7aa485759d56b00741d05e1d484f3280bfa217bc1226444f62245bce06bc91d2 |
| curl | linux | mips64 | musl | bf759293f1940c817f00db125be6bc8f5b55b64fa035c7bd5cbe1390ceb4f4b1 |
| curl | linux | mips64el | glibc | a02a1fcee13610026df126c6a01090d8e2fb054814b20845bf71517fd5722ec2 |
| curl | linux | mips64el | musl | 4cbab66d1e39b9dccdabd4f6477a1d33bca5b1fb7be2134b104eade92288dd87 |
| curl | linux | mipsel | glibc | 68cf573bcb1dcbce599619199c5771688d02a3a470ad0c5dc6490d467409f0c2 |
| curl | linux | mipsel | musl | 92a88c01a1448bbebcea4e9cd4c6f164773fdd09230a2d13306499c8722685f2 |
| curl | linux | powerpc | glibc | 51010253bda833f75d19b33539df6001e064ad45cf466e442ed8240d5baab136 |
| curl | linux | powerpc | musl | b8d305403b1cd04940a2348dac0b3b82b340a606d9da362da09dd1f5ca0a5262 |
| curl | linux | powerpc64le | glibc | 3298e327f67e2bed146d08cbae17aa2ddffc61a84edd799baa7a09f2ab1f5629 |
| curl | linux | powerpc64le | musl | abe349c0e40fa786e983d9e12e06d87553bad610287fd3d04f3314af3f7d0dda |
| curl | linux | riscv64 | glibc | f9879b5d945911f57dd785b316fc6cc53d9f85eb96b72c28ad8cd3969f68cdb7 |
| curl | linux | riscv64 | musl | 20c0ee10e32afec22d797b2ab3b43b2dc6771e05b157bd0fc3a795f10473eb36 |
| curl | linux | s390x | glibc | 17922823811d988ec99ccc64b1f31553ca465289d55f3dfac14d89457b10f5cc |
| curl | linux | s390x | musl | 090ab913bb203ad964468ed6b3216e5aa4191710133d06420b15f10fbccf99a0 |
| curl | linux | x86_64 | glibc | ab5148755964711b9e1f78cc8a1abdba98dbfaf0575b5b5cdba16bcd0964a427 |
| curl | linux | x86_64 | musl | ca721dfb245b36b3bf2fe13d5fd15849c2f5298a3b9c8ef4d2c7433a533543db |
| curl | macos | arm64 |  | 26cc7056e4eeb443097fa4d7bfc0e08fcf3de641943e3bdcd8b05dbb698579a9 |
| curl | macos | x86_64 |  | 95c73d4ebb59aeb9dc4c0607a8d2ea5032c49e9ce337492ef054830145ace2ba |
| curl | windows | aarch64 |  | fbb45a0a435e824ed2c02bb12828c917871d6396e27b172da971c0faabd28a66 |
| curl | windows | armv7 |  | ec8c7c8608d402c74f61cc84092cd1ff7f8467c9e729476df4effdd4e94b02bc |
| curl | windows | i686 |  | af0d54384cab06a4abd394305970a20f7a340085ceaa1e3b59b80c8828ec5f84 |
| curl | windows | x86_64 |  | 5412d40de39f891e18ccde6cb6ffc50425791c58bf1f1b7af3e28f60a8eaa682 |



target: target#update-version-ubuntu
----------------------------
✔ The line #33, matched by the keyword "ENV" and the matcher "CURL_VERSION", is correctly set to "ENV CURL_VERSION=8.13.0".
✔ - changed lines [] of file "/tmp/updatecli/stash/oci-cdx/ubuntu/.templates/Dockerfile"

target: target#run-make-ubuntu-repo
---------------------------


#######
# DEX #
#######

source: source#dex-version
------------------
Searching for version matching pattern "^v[0-9]+\\.[0-9]+\\.[0-9]+$"
✔ GitHub release version "v2.42.0" found matching pattern "^v[0-9]+\\.[0-9]+\\.[0-9]+$" of kind "regex"
[transformers]
✔ Result correctly transformed from "v2.42.0" to "2.42.0"


CHANGELOG:
----------

Release published on the 2025-02-19 13:18:29 +0000 UTC at the url https://github.com/dexidp/dex/releases/tag/v2.42.0

<!-- Release notes generated using configuration in .github/release.yml at v2.42.0 -->

## What's Changed
### Exciting New Features 🎉
* feat: also allow localhost equivalent IP addresses by @dsonck92 in https://github.com/dexidp/dex/pull/3778
### Enhancements 🚀
* Added Discovery to grpc by @koendelaat in https://github.com/dexidp/dex/pull/3598
* feat(metrics): add response_size, request_duration histograms by @IvoGoman in https://github.com/dexidp/dex/pull/3748
* Handle root path better (than nothing) by @nabokihms in https://github.com/dexidp/dex/pull/3747
* Support base64 encoded and PEM encoded certs by @nabokihms in https://github.com/dexidp/dex/pull/3751
* GitLab connector: add GitLab additional group with role  by @zvlb in https://github.com/dexidp/dex/pull/2941
* OIDC Connector: Support for IssuerAlias and group claims with maps instead of strings by @meldsza in https://github.com/dexidp/dex/pull/3676
* Add CSS for example app to make it prettier by @nabokihms in https://github.com/dexidp/dex/pull/3886
* feat: set resource revision for connectors by @nrwiersma in https://github.com/dexidp/dex/pull/3868
* Add authproxy preferred_username header by @kotx in https://github.com/dexidp/dex/pull/3950
* Passing context storage by @bobmaertz in https://github.com/dexidp/dex/pull/3941
### Bug Fixes 🐛
* Fix scheme for DialURL ldap connection by @nabokihms in https://github.com/dexidp/dex/pull/3677
* Change workdir for gomplate by @nabokihms in https://github.com/dexidp/dex/pull/3684
* fix unmarshaling of expanded environment variables with special characters by @tuminoid in https://github.com/dexidp/dex/pull/3770
* saml connector: fix nil pointer PANIC on validate saml by @siarhei-haurylau in https://github.com/dexidp/dex/pull/3793
* fix: update enhancement proposal link by @emmanuel-ferdman in https://github.com/dexidp/dex/pull/3755
* Create offline sessions if approval is skipped by @nabokihms in https://github.com/dexidp/dex/pull/3828
### Dependency Updates ⬆️
* build(deps): bump golang from 1.22.5-alpine3.20 to 1.23.1-alpine3.20 by @dependabot in https://github.com/dexidp/dex/pull/3728
* build(deps): bump alpine from 3.20.2 to 3.20.3 by @dependabot in https://github.com/dexidp/dex/pull/3729
* build(deps): bump golang.org/x/net from 0.27.0 to 0.29.0 by @dependabot in https://github.com/dexidp/dex/pull/3726
* build(deps): bump golang.org/x/oauth2 from 0.21.0 to 0.23.0 in /examples by @dependabot in https://github.com/dexidp/dex/pull/3722
* build(deps): bump actions/attest-build-provenance from 1.4.0 to 1.4.3 by @dependabot in https://github.com/dexidp/dex/pull/3727
* build(deps): bump google.golang.org/grpc from 1.65.0 to 1.66.1 in /examples by @dependabot in https://github.com/dexidp/dex/pull/3731
* build(deps): bump distroless/static-debian12 from `8dd8d3c` to `42d15c6` by @dependabot in https://github.com/dexidp/dex/pull/3724
* build(deps): bump tonistiigi/xx from 1.4.0 to 1.5.0 by @dependabot in https://github.com/dexidp/dex/pull/3705
* build(deps): bump google.golang.org/api from 0.190.0 to 0.196.0 by @dependabot in https://github.com/dexidp/dex/pull/3721
* build(deps): bump docker/build-push-action from 6.5.0 to 6.7.0 by @dependabot in https://github.com/dexidp/dex/pull/3696
* build(deps): bump golang.org/x/oauth2 from 0.21.0 to 0.23.0 by @dependabot in https://github.com/dexidp/dex/pull/3723
* build(deps): bump sigstore/cosign-installer from 3.5.0 to 3.6.0 by @dependabot in https://github.com/dexidp/dex/pull/3685
* build(deps): bump actions/upload-artifact from 4.3.4 to 4.4.0 by @dependabot in https://github.com/dexidp/dex/pull/3720
* build(deps): bump github.com/dexidp/dex/api/v2 from 2.1.0 to 2.2.0 in /examples by @dependabot in https://github.com/dexidp/dex/pull/3734
* build(deps): bump mheap/github-action-required-labels from 5.4.1 to 5.4.2 by @dependabot in https://github.com/dexidp/dex/pull/3735
* build(deps): bump github.com/mattn/go-sqlite3 from 1.14.22 to 1.14.23 by @dependabot in https://github.com/dexidp/dex/pull/3738
* build(deps): bump google.golang.org/grpc from 1.66.0 to 1.66.2 by @dependabot in https://github.com/dexidp/dex/pull/3742
* build(deps): bump distroless/static-debian12 from `42d15c6` to `dcd3f1f` by @dependabot in https://github.com/dexidp/dex/pull/3754
* build(deps): bump anchore/sbom-action from 0.17.0 to 0.17.2 by @dependabot in https://github.com/dexidp/dex/pull/3746
* build(deps): bump github.com/Masterminds/sprig/v3 from 3.2.3 to 3.3.0 by @dependabot in https://github.com/dexidp/dex/pull/3753
* build(deps): bump aquasecurity/trivy-action from 0.24.0 to 0.28.0 by @dependabot in https://github.com/dexidp/dex/pull/3797
* build(deps): bump github/codeql-action from 3.25.15 to 3.26.13 by @dependabot in https://github.com/dexidp/dex/pull/3795
* build(deps): bump golang from 1.23.1-alpine3.20 to 1.23.2-alpine3.20 by @dependabot in https://github.com/dexidp/dex/pull/3775
* build(deps): bump distroless/static-debian12 from `dcd3f1f` to `26f9b99` by @dependabot in https://github.com/dexidp/dex/pull/3766
* build(deps): bump cloud.google.com/go/compute/metadata from 0.5.0 to 0.5.2 by @dependabot in https://github.com/dexidp/dex/pull/3764
* build(deps): bump docker/setup-buildx-action from 3.6.1 to 3.7.1 by @dependabot in https://github.com/dexidp/dex/pull/3781
* build(deps): bump google.golang.org/grpc from 1.66.1 to 1.67.1 in /examples by @dependabot in https://github.com/dexidp/dex/pull/3774
* build(deps): bump docker/build-push-action from 6.7.0 to 6.9.0 by @dependabot in https://github.com/dexidp/dex/pull/3772
* build(deps): bump anchore/sbom-action from 0.17.2 to 0.17.4 by @dependabot in https://github.com/dexidp/dex/pull/3801
* build(deps): bump github.com/prometheus/client_golang from 1.19.1 to 1.20.5 by @dependabot in https://github.com/dexidp/dex/pull/3799
* build(deps): bump golang.org/x/net from 0.29.0 to 0.30.0 by @dependabot in https://github.com/dexidp/dex/pull/3802
* build(deps): bump actions/dependency-review-action from 4.3.4 to 4.3.5 by @dependabot in https://github.com/dexidp/dex/pull/3804
* build(deps): bump anchore/sbom-action from 0.17.4 to 0.17.5 by @dependabot in https://github.com/dexidp/dex/pull/3803
* build(deps): bump sigstore/cosign-installer from 3.6.0 to 3.7.0 by @dependabot in https://github.com/dexidp/dex/pull/3800
* build(deps): bump github.com/mattn/go-sqlite3 from 1.14.23 to 1.14.24 by @dependabot in https://github.com/dexidp/dex/pull/3805
* build(deps): bump github/codeql-action from 3.26.13 to 3.27.0 by @dependabot in https://github.com/dexidp/dex/pull/3806
* build(deps): bump actions/checkout from 4.1.7 to 4.2.1 by @dependabot in https://github.com/dexidp/dex/pull/3785
* build(deps): bump google.golang.org/api from 0.196.0 to 0.203.0 by @dependabot in https://github.com/dexidp/dex/pull/3807
* build(deps): bump actions/checkout from 4.2.1 to 4.2.2 by @dependabot in https://github.com/dexidp/dex/pull/3808
* build(deps): bump actions/dependency-review-action from 4.3.5 to 4.4.0 by @dependabot in https://github.com/dexidp/dex/pull/3814
* build(deps): bump distroless/static-debian12 from `26f9b99` to `3a03fc0` by @dependabot in https://github.com/dexidp/dex/pull/3812
* build(deps): bump actions/setup-go from 5.0.2 to 5.1.0 by @dependabot in https://github.com/dexidp/dex/pull/3809
* build(deps): bump anchore/sbom-action from 0.17.5 to 0.17.6 by @dependabot in https://github.com/dexidp/dex/pull/3817
* build(deps): bump github.com/fsnotify/fsnotify from 1.7.0 to 1.8.0 by @dependabot in https://github.com/dexidp/dex/pull/3822
* build(deps): bump alpine from `beefdbd` to `1e42bbe` by @dependabot in https://github.com/dexidp/dex/pull/3840
* build(deps): bump golang.org/x/oauth2 from 0.23.0 to 0.24.0 in /examples by @dependabot in https://github.com/dexidp/dex/pull/3832
* build(deps): bump golang from 1.23.2-alpine3.20 to 1.23.3-alpine3.20 by @dependabot in https://github.com/dexidp/dex/pull/3834
* build(deps): bump anchore/sbom-action from 0.17.6 to 0.17.8 by @dependabot in https://github.com/dexidp/dex/pull/3858
* build(deps): bump distroless/static-debian12 from `3a03fc0` to `d71f4b2` by @dependabot in https://github.com/dexidp/dex/pull/3839
* build(deps): bump golang from `0974259` to `c694a4d` by @dependabot in https://github.com/dexidp/dex/pull/3863
* build(deps): bump tonistiigi/xx from 1.5.0 to 1.6.1 by @dependabot in https://github.com/dexidp/dex/pull/3879
* build(deps): bump golang.org/x/crypto from 0.28.0 to 0.31.0 in the go_modules group by @dependabot in https://github.com/dexidp/dex/pull/3893
* build(deps): bump golang.org/x/crypto from 0.26.0 to 0.31.0 in /examples in the go_modules group by @dependabot in https://github.com/dexidp/dex/pull/3892
* build(deps): bump github/codeql-action from 3.27.0 to 3.28.0 by @dependabot in https://github.com/dexidp/dex/pull/3898
* build(deps): bump actions/upload-artifact from 4.4.0 to 4.5.0 by @dependabot in https://github.com/dexidp/dex/pull/3890
* build(deps): bump actions/attest-build-provenance from 1.4.3 to 2.1.0 by @dependabot in https://github.com/dexidp/dex/pull/3878
* build(deps): bump golang from 1.23.3-alpine3.20 to 1.23.4-alpine3.20 by @dependabot in https://github.com/dexidp/dex/pull/3866
* build(deps): bump distroless/static-debian12 from `d71f4b2` to `6cd937e` by @dependabot in https://github.com/dexidp/dex/pull/3864
* build(deps): bump actions/dependency-review-action from 4.4.0 to 4.5.0 by @dependabot in https://github.com/dexidp/dex/pull/3862
* build(deps): bump docker/metadata-action from 5.5.1 to 5.6.1 by @dependabot in https://github.com/dexidp/dex/pull/3861
* build(deps): bump aquasecurity/trivy-action from 0.28.0 to 0.29.0 by @dependabot in https://github.com/dexidp/dex/pull/3851
* build(deps): bump gomplate from 4.0.1 to 4.3.0 by @MoeBensu in https://github.com/dexidp/dex/pull/3856
* build: update Go version by @sagikazarmark in https://github.com/dexidp/dex/pull/3913
* build(deps): bump github.com/beevik/etree from 1.4.0 to 1.4.1 by @dependabot in https://github.com/dexidp/dex/pull/3638
* build(deps): bump go.etcd.io/etcd/client/v3 from 3.5.15 to 3.5.17 by @dependabot in https://github.com/dexidp/dex/pull/3842
* build(deps): bump github.com/coreos/go-oidc/v3 from 3.11.0 to 3.12.0 in /examples by @dependabot in https://github.com/dexidp/dex/pull/3903
* build(deps): bump golang.org/x/oauth2 from 0.24.0 to 0.25.0 in /examples by @dependabot in https://github.com/dexidp/dex/pull/3904
* build(deps): bump alpine from 3.20.3 to 3.21.2 by @dependabot in https://github.com/dexidp/dex/pull/3909
* build(deps): bump golang.org/x/net from 0.30.0 to 0.33.0 in the go_modules group by @dependabot in https://github.com/dexidp/dex/pull/3911
* build(deps): bump docker/setup-qemu-action from 3.2.0 to 3.3.0 by @dependabot in https://github.com/dexidp/dex/pull/3914
* build(deps): bump helm/kind-action from 1.10.0 to 1.12.0 by @dependabot in https://github.com/dexidp/dex/pull/3917
* build(deps): bump docker/setup-buildx-action from 3.7.1 to 3.8.0 by @dependabot in https://github.com/dexidp/dex/pull/3916
* build(deps): bump anchore/sbom-action from 0.17.8 to 0.17.9 by @dependabot in https://github.com/dexidp/dex/pull/3915
* build(deps): bump actions/cache from 4.1.2 to 4.2.0 by @dependabot in https://github.com/dexidp/dex/pull/3918
* build(deps): bump golang from 1.23.4-alpine3.20 to 1.23.5-alpine3.20 by @dependabot in https://github.com/dexidp/dex/pull/3928
* build(deps): bump golang.org/x/net from 0.30.0 to 0.34.0 by @dependabot in https://github.com/dexidp/dex/pull/3920
* build(deps): bump distroless/static-debian12 from `6cd937e` to `6ec5aa9` by @dependabot in https://github.com/dexidp/dex/pull/3922
* build(deps): bump golang.org/x/net from 0.28.0 to 0.33.0 in /examples in the go_modules group by @dependabot in https://github.com/dexidp/dex/pull/3912
* build(deps): bump google.golang.org/api from 0.203.0 to 0.217.0 by @dependabot in https://github.com/dexidp/dex/pull/3927
* build(deps): bump google.golang.org/grpc from 1.67.1 to 1.69.4 in /examples by @dependabot in https://github.com/dexidp/dex/pull/3924
* build(deps): bump golang.org/x/net from 0.27.0 to 0.33.0 in /api/v2 in the go_modules group by @dependabot in https://github.com/dexidp/dex/pull/3910
* build(deps): bump google.golang.org/grpc from 1.65.0 to 1.69.4 in /api/v2 by @dependabot in https://github.com/dexidp/dex/pull/3925
* build(deps): bump github.com/stretchr/testify from 1.9.0 to 1.10.0 by @dependabot in https://github.com/dexidp/dex/pull/3931
* build(deps): bump google.golang.org/grpc from 1.69.4 to 1.70.0 in /examples by @dependabot in https://github.com/dexidp/dex/pull/3943
* build(deps): bump actions/upload-artifact from 4.5.0 to 4.6.0 by @dependabot in https://github.com/dexidp/dex/pull/3939
* build(deps): bump oras-project/setup-oras from 1.2.1 to 1.2.2 by @dependabot in https://github.com/dexidp/dex/pull/3936
* build(deps): bump github.com/go-ldap/ldap/v3 from 3.4.8 to 3.4.10 by @dependabot in https://github.com/dexidp/dex/pull/3932
* build(deps): bump docker/build-push-action from 6.9.0 to 6.13.0 by @dependabot in https://github.com/dexidp/dex/pull/3949
* build(deps): bump github/codeql-action from 3.28.0 to 3.28.8 by @dependabot in https://github.com/dexidp/dex/pull/3956
* build(deps): bump github.com/coreos/go-oidc/v3 from 3.11.0 to 3.12.0 by @dependabot in https://github.com/dexidp/dex/pull/3933
* build(deps): bump google.golang.org/protobuf from 1.36.2 to 1.36.4 by @dependabot in https://github.com/dexidp/dex/pull/3947
* build(deps): bump actions/setup-go from 5.1.0 to 5.3.0 by @dependabot in https://github.com/dexidp/dex/pull/3935
* build(deps): bump github.com/beevik/etree from 1.4.1 to 1.5.0 by @dependabot in https://github.com/dexidp/dex/pull/3966
* build(deps): bump anchore/sbom-action from 0.17.9 to 0.18.0 by @dependabot in https://github.com/dexidp/dex/pull/3960
* build(deps): bump mheap/github-action-required-labels from 5.4.2 to 5.5.0 by @dependabot in https://github.com/dexidp/dex/pull/3961
* build(deps): bump actions/attest-build-provenance from 2.1.0 to 2.2.0 by @dependabot in https://github.com/dexidp/dex/pull/3962
* build(deps): bump go.etcd.io/etcd/client/pkg/v3 from 3.5.17 to 3.5.18 by @dependabot in https://github.com/dexidp/dex/pull/3963
* build(deps): bump go.etcd.io/etcd/client/v3 from 3.5.17 to 3.5.18 by @dependabot in https://github.com/dexidp/dex/pull/3965
* build(deps): bump google.golang.org/api from 0.217.0 to 0.219.0 by @dependabot in https://github.com/dexidp/dex/pull/3964
* build(deps): bump golang.org/x/oauth2 from 0.25.0 to 0.26.0 by @dependabot in https://github.com/dexidp/dex/pull/3969
* build(deps): bump golang from 1.23.5-alpine3.20 to 1.23.6-alpine3.20 by @dependabot in https://github.com/dexidp/dex/pull/3972
* build(deps): bump sigstore/cosign-installer from 3.7.0 to 3.8.0 by @dependabot in https://github.com/dexidp/dex/pull/3970
* build(deps): bump golang.org/x/oauth2 from 0.25.0 to 0.26.0 in /examples by @dependabot in https://github.com/dexidp/dex/pull/3968
* build(deps): bump google.golang.org/api from 0.219.0 to 0.220.0 by @dependabot in https://github.com/dexidp/dex/pull/3973
* build(deps): bump google.golang.org/protobuf from 1.36.4 to 1.36.5 by @dependabot in https://github.com/dexidp/dex/pull/3975
* build(deps): bump docker/setup-buildx-action from 3.8.0 to 3.9.0 by @dependabot in https://github.com/dexidp/dex/pull/3977
* build(deps): bump docker/setup-qemu-action from 3.3.0 to 3.4.0 by @dependabot in https://github.com/dexidp/dex/pull/3978
* build(deps): bump golang.org/x/crypto from 0.32.0 to 0.33.0 by @dependabot in https://github.com/dexidp/dex/pull/3980
* build(deps): bump github/codeql-action from 3.28.8 to 3.28.9 by @dependabot in https://github.com/dexidp/dex/pull/3981
* build(deps): bump google.golang.org/api from 0.220.0 to 0.221.0 by @dependabot in https://github.com/dexidp/dex/pull/3985
* build(deps): bump google.golang.org/protobuf from 1.35.1 to 1.36.5 in /api/v2 by @dependabot in https://github.com/dexidp/dex/pull/3976
* build(deps): bump google.golang.org/grpc from 1.69.4 to 1.70.0 in /api/v2 by @dependabot in https://github.com/dexidp/dex/pull/3944
* build(deps): bump github.com/spf13/cobra from 1.8.1 to 1.9.1 in /examples by @dependabot in https://github.com/dexidp/dex/pull/3988
* build(deps): bump golang from 1.23.6-alpine3.20 to 1.24.0-alpine3.20 by @dependabot in https://github.com/dexidp/dex/pull/3984
* Update Go to 1.24 by @sagikazarmark in https://github.com/dexidp/dex/pull/3993
* build(deps): bump alpine from 3.21.2 to 3.21.3 by @dependabot in https://github.com/dexidp/dex/pull/3986
* build(deps): bump golang from `9fed402` to `79f7ffe` by @dependabot in https://github.com/dexidp/dex/pull/3992
* build(deps): bump github.com/spf13/cobra from 1.8.1 to 1.9.1 by @dependabot in https://github.com/dexidp/dex/pull/3987
* build(deps): bump github.com/go-sql-driver/mysql from 1.8.1 to 1.9.0 by @dependabot in https://github.com/dexidp/dex/pull/3991

## New Contributors
* @hur made their first contribution in https://github.com/dexidp/dex/pull/3700
* @koendelaat made their first contribution in https://github.com/dexidp/dex/pull/3598
* @IvoGoman made their first contribution in https://github.com/dexidp/dex/pull/3748
* @dsonck92 made their first contribution in https://github.com/dexidp/dex/pull/3778
* @siarhei-haurylau made their first contribution in https://github.com/dexidp/dex/pull/3793
* @emmanuel-ferdman made their first contribution in https://github.com/dexidp/dex/pull/3755
* @zvlb made their first contribution in https://github.com/dexidp/dex/pull/2941
* @meldsza made their first contribution in https://github.com/dexidp/dex/pull/3676
* @nrwiersma made their first contribution in https://github.com/dexidp/dex/pull/3868
* @JanMkl made their first contribution in https://github.com/dexidp/dex/pull/3930
* @kotx made their first contribution in https://github.com/dexidp/dex/pull/3950
* @bobmaertz made their first contribution in https://github.com/dexidp/dex/pull/3941

**Full Changelog**: https://github.com/dexidp/dex/compare/v2.41.0...v2.42.0

target: target#staging-version-kustomize
--------------------------------
WARNING: branch "refs/heads/updatecli_main_9d0fbf9349f646f1435072f2b0212084752ef4601bd6b012fbbe61b6c5e03930" diverged from "refs/heads/main", resetting it to "refs/heads/main"
⚠ - change detected:
        * key "$.values.dex.version" updated from "2.41.1" to "2.42.0", in file "clusters/argo-dev/namespaces/cdx-argo/values.yaml"

target: target#production-version-kustomize
-----------------------------------
⚠ - change detected:
        * key "$.values.dex.version" updated from "2.41.1" to "2.42.0", in file "clusters/argo-prod/namespaces/cdx-argo/values.yaml"


######
# GO #
######

source: source#latest_1_24
------------------
Searching for version matching pattern "1.24.x"
✔ Golang version 1.24.2 found


CHANGELOG:
----------
Golang changelog for version "1.24.2" is available on "https://go.dev/doc/devel/release#go1.24.minor"

target: target#update_templates_json_go_1_24
------------------------------------
✔ - all contents from 'file' and 'files' combined already up to date

source: source#latest_1_23
------------------
Searching for version matching pattern "1.23.x"
✔ Golang version 1.23.8 found


CHANGELOG:
----------
Golang changelog for version "1.23.8" is available on "https://go.dev/doc/devel/release#go1.23.minor"

target: target#update_templates_json_go_1_23
------------------------------------
✔ - all contents from 'file' and 'files' combined already up to date

target: target#run-make-build-go-repo
-----------------------------


#################
# GOLANGCI-LINT #
#################

source: source#golangci-lint-version
----------------------------
Searching for version matching pattern "*"
✔ GitHub release version "v2.0.2" found matching pattern "*" of kind "semver"
[transformers]
✔ Result correctly transformed from "v2.0.2" to "2.0.2"


CHANGELOG:
----------

Release published on the 2025-03-25 22:00:38 +0000 UTC at the url https://github.com/golangci/golangci-lint/releases/tag/v2.0.2

`golangci-lint` is a free and open-source project built by volunteers.

If you value it, consider supporting us, the [maintainers](https://opencollective.com/golangci-lint) and [linter authors](https://golangci-lint.run/product/thanks/).

We appreciate it! :heart:

For key updates, see the [changelog](https://golangci-lint.run/product/changelog/#202).

## Changelog
* b9ddaab98cd4bd396fed3f4c547e98ab6f0ab77c fix: enable formatters with flags (#5620)
* 3fc5dfb31457617fd313083ab34aa8a6ad9f4065 fix: formatter validation message (#5624)
* cb43da6f90dde98ac1fbdb6c25ac2839347ade30 fix: use absolute filepath inside base rule source (#5629)



target: target#update-version-build-go
------------------------------
[transformers]
✔ Result correctly transformed from "2.0.2" to "\"2.0.2"
✔ Result correctly transformed from "\"2.0.2" to "\"2.0.2\""
WARNING: branch "refs/heads/updatecli_main_ab15d4358f6fb34af08a9a41b4635b9e4294e15932a6f8dc5ea18a0837d6d282" diverged from "refs/heads/main", resetting it to "refs/heads/main"
✔ The line #323, matched by the keyword "ENV" and the matcher "GOLANGCI_LINT_VERSION", is correctly set to "ENV GOLANGCI_LINT_VERSION=\"2.0.2\"".
✔ - changed lines [] of file "/tmp/updatecli/stash/oci-cdx/build-go/.templates/Dockerfile"

⚠ While nothing change in the current pipeline run, according to the git history, some commits must be pushed

target: target#run-make-build-go-repo
-----------------------------
The shell 🐚 command "/bin/sh /tmp/updatecli/bin/0b1d084139222b8589e9e8626b15715fe141c117dbec7b6b9c1bc29a20b088e6.sh" ran successfully with the following output:
----
1.23-jammy
1.23-focal
1.24-jammy
1.24-focal
----
⚠ - ran shell command "make update"

ERROR: something went wrong in "target#run-make-build-go-repo" : something went wrong in target "run-make-build-go-repo" : "no changed file to commit"

Pipeline "golangci-lint" failed
Skipping due to:
        something went wrong during target execution


##############
# GORELEASER #
##############

source: source#goreleaser-version
-------------------------
Searching for version matching pattern "*"
✔ GitHub release version "v2.8.2" found matching pattern "*" of kind "semver"
[transformers]
✔ Result correctly transformed from "v2.8.2" to "2.8.2"


CHANGELOG:
----------

Release published on the 2025-04-01 02:21:52 +0000 UTC at the url https://github.com/goreleaser/goreleaser/releases/tag/v2.8.2

## Changelog
### Bug fixes
* 66456cb3c30adc410b6dde1fb0185266651ed9ac: fix(nix): cleanup, docs updates, test names (@caarlos0)
* e2dde95f14572a550240dc35cf3b52d6b4a51574: fix(nix): use nix-hash instead of nix-prefetch-url (#5669) (@caarlos0)
* 41d529a40c75eb5635b7080e32bf75a17f871e06: fix(winget): better handle publisher name (#5643) (@caarlos0)
* 5b9edcb5bfb14c988e424d4990bf3571a4886a83: fix(winget): make tags lowercase (#5664) (@vedantmgoyal9)
* 0cb58bf884b87af3c42337c702b2d56ae0e462ab: fix(winget): tags: replace spaces with dash (@caarlos0)
* 47092be2304535b75699eb5a588af807c11739f3: fix(winget): update manifest schema to latest (1.10.0)  (#5683) (@vedantmgoyal9)
* 2d07c80923ac8a85886544b5dfb40160aa9ba90b: fix: do not set extra replaces to nil (@caarlos0)
* 7ccc685d313d0266cc7823d4b00f2cb30e5bc168: fix: jsonschema (@caarlos0)
* b165c3b57551bcbd7bd3c151fd9a9b7a308978bf: fix: lint (@caarlos0)
* 28056f9f22249c1695470ff5b15670fab2c28c59: fix: lint issues (#5678) (@caarlos0)
* c3d894a58744d6e1b47286dd2ab998bc39a953a3: fix: lint issues (2nd pass) (#5681) (@caarlos0)
* 8bca8c2edaecab2d41e4b586eefe3ea1226e0d29: refactor: ExtraOr, MustExtra (#5685) (@caarlos0)
* 6924ac7d6536edec97344746cebfd97c6919ddb7: refactor: improve extra cast errors (@caarlos0)
* 2d6d9dcce663a4e1bd88b70979cf3e822e9f59af: refactor: modernize codebase (@caarlos0)
* 8def079970d25e162f860618973dac6c3dc8c659: refactor: organize config code a bit better (@caarlos0)
* 43ebaaf43efb7133c1505c9ea4e1f73dbc7ca9c3: refactor: replace interface{} with any (@caarlos0)
### Documentation updates
* 16cc61ce20a67fccaf1295f522849d3d524c5085: docs: alert Markdown Tip section (#5677) (@guspan-tanadi)
* 616a711f3566ec34d067dfe491b6b5279056fb8f: docs: fix site home (@caarlos0)
* a71920c3050ebdc6a0679d1f988f2c15026cec4b: docs: fix typos in builds/rust (@caarlos0)
* d46aa25b9147110daac0be336a0dc37becb2f564: docs: improve home page (@caarlos0)
* f179a4c624d2af60e3abf2846d75d74922a51062: docs: install with npm (@caarlos0)
* dfdce06db61a2e772cce3b0f8cdb2254359f6d16: docs: move sponsors to navbar (#5661) (@vedantmgoyal9)
* fdec0a4d258dc1eb866c9dde035248c2d08a607f: docs: readme update (#5650) (@caarlos0)
* 1300b78044f36412119979f2d4ab3da2d0f4b69f: docs: remove announcement (@caarlos0)
* 009c573cc9f944128af81188923d4d45f2da2e5e: docs: use docker and pip instead of nix (#5672) (@caarlos0)
### Other work
* 10146baa5714c7fdb13e7b7bdb0aa13b260d61e8: chore: fix imports (@caarlos0)
* 3d0def37324b67cb386a980f8391d33f6d9f0b75: chore: fix imports (@caarlos0)
* 56df94a1189d74b35883752b2d35c97254aea827: perf: improve default gpg path detection (#5651) (@caarlos0)

**Full Changelog**: https://github.com/goreleaser/goreleaser/compare/v2.8.1...v2.8.2


## Helping out

This release is only possible thanks to **all** the support of some **awesome people**!

Want to be one of them?
You can [sponsor](https://goreleaser.com/sponsors/), get a [Pro License](https://goreleaser.com/pro) or [contribute with code](https://goreleaser.com/contributing).

## Where to go next?

* Find examples and commented usage of all options in our [website](https://goreleaser.com/intro/).
* Reach out on [Discord](https://discord.gg/RGEBtg8vQ6) and [Twitter](https://twitter.com/goreleaser)!

<a href="https://goreleaser.com"><img src="https://raw.githubusercontent.com/goreleaser/artwork/master/opencollective-header.png" with="100%" alt="GoReleaser logo"></a>




target: target#update-version-build-go
------------------------------
[transformers]
✔ Result correctly transformed from "2.8.2" to "\"2.8.2"
✔ Result correctly transformed from "\"2.8.2" to "\"2.8.2\""
⚠ The line #316, matched by the keyword "ENV" and the matcher "GORELEASER_VERSION", is changed from "ENV GORELEASER_VERSION=\"2.7.0\"" to "ENV GORELEASER_VERSION=\"2.8.2\"".
⚠ - changed lines [316] of file "/tmp/updatecli/stash/oci-cdx/build-go/.templates/Dockerfile"

target: target#run-make-build-go-repo
-----------------------------
The shell 🐚 command "/bin/sh /tmp/updatecli/bin/0b1d084139222b8589e9e8626b15715fe141c117dbec7b6b9c1bc29a20b088e6.sh" ran successfully with the following output:
----
1.23-jammy
1.23-focal
1.24-jammy
1.24-focal
----
⚠ - ran shell command "make update"


#############
# JFROG-CLI #
#############

source: source#version
--------------
Searching for version matching pattern "~2"
✔ GitHub release version "v2.74.1" found matching pattern "~2" of kind "semver"
[transformers]
✔ Result correctly transformed from "v2.74.1" to "2.74.1"


CHANGELOG:
----------

Release published on the 2025-03-23 12:20:14 +0000 UTC at the url https://github.com/jfrog/jfrog-cli/releases/tag/v2.74.1

<!-- Release notes generated using configuration in .github/release.yml at v2.74.1 -->

## What's Changed

### Improvements 🌱
* Bug fixes and improvements in JAS in https://github.com/jfrog/jfrog-cli-security/pull/380
* Update internal dependencies in https://github.com/jfrog/jfrog-cli/pull/2927

**Full Changelog**: https://github.com/jfrog/jfrog-cli/compare/v2.74.0...v2.74.1
<details>
    <summary>Downloads JFrog CLI</summary>

### Linux

[386](https://releases.jfrog.io/artifactory/jfrog-cli/v2-jf/2.74.1/jfrog-cli-linux-386/jf)
[AMD-64](https://releases.jfrog.io/artifactory/jfrog-cli/v2-jf/2.74.1/jfrog-cli-linux-amd64/jf)
[ARM-32](https://releases.jfrog.io/artifactory/jfrog-cli/v2-jf/2.74.1/jfrog-cli-linux-arm/jf)
[ARM-64](https://releases.jfrog.io/artifactory/jfrog-cli/v2-jf/2.74.1/jfrog-cli-linux-arm64/jf)
[PPC-64](https://releases.jfrog.io/artifactory/jfrog-cli/v2-jf/2.74.1/jfrog-cli-linux-ppc64/jf)
[PPC-64-LE](https://releases.jfrog.io/artifactory/jfrog-cli/v2-jf/2.74.1/jfrog-cli-linux-ppc64le/jf)
[S390X](https://releases.jfrog.io/artifactory/jfrog-cli/v2-jf/2.74.1/jfrog-cli-linux-s390x/jf)

### MacOS

[AMD-64](https://releases.jfrog.io/artifactory/jfrog-cli/v2-jf/2.74.1/jfrog-cli-mac-386/jf)
[ARM-64](https://releases.jfrog.io/artifactory/jfrog-cli/v2-jf/2.74.1/jfrog-cli-mac-arm64/jf)

### Windows

[AMD-64](https://releases.jfrog.io/artifactory/jfrog-cli/v2-jf/2.74.1/jfrog-cli-windows-amd64/jf.exe)

</details>


target: target#update-version-build-go
------------------------------
✔ The line #331, matched by the keyword "ENV" and the matcher "JFROG_CLI_VERSION", is correctly set to "ENV JFROG_CLI_VERSION=2.74.1".
✔ - changed lines [] of file "/tmp/updatecli/stash/oci-cdx/build-go/.templates/Dockerfile"

target: target#run-make-build-go-repo
-----------------------------



##########
# PYTHON #
##########

source: source#latest_3_12
------------------
WARNING: ⚠ No GitHub Release found, we fallback to published git tags
Searching for version matching pattern "3.12.\\d+$"
✔ GitHub release version "v3.12.9" found matching pattern "3.12.\\d+$" of kind "regex"
[transformers]
✔ Result correctly transformed from "v3.12.9" to "3.12.9"


CHANGELOG:
----------
no GitHub Release found for v3.12.9 on "https://github.com/python/cpython"

source: source#latest_3_9
-----------------
WARNING: ⚠ No GitHub Release found, we fallback to published git tags
Searching for version matching pattern "3.9.\\d+$"
✔ GitHub release version "v3.9.21" found matching pattern "3.9.\\d+$" of kind "regex"
[transformers]
✔ Result correctly transformed from "v3.9.21" to "3.9.21"


CHANGELOG:
----------
no GitHub Release found for v3.9.21 on "https://github.com/python/cpython"

target: target#update_templates_json_python_3_9
---------------------------------------
✔ - all contents from 'file' and 'files' combined already up to date

source: source#latest_3_10
------------------
WARNING: ⚠ No GitHub Release found, we fallback to published git tags
Searching for version matching pattern "3.10.\\d+$"
✔ GitHub release version "v3.10.16" found matching pattern "3.10.\\d+$" of kind "regex"
[transformers]
✔ Result correctly transformed from "v3.10.16" to "3.10.16"


CHANGELOG:
----------
no GitHub Release found for v3.10.16 on "https://github.com/python/cpython"

source: source#latest_3_11
------------------
WARNING: ⚠ No GitHub Release found, we fallback to published git tags
Searching for version matching pattern "3.11.\\d+$"
✔ GitHub release version "v3.11.11" found matching pattern "3.11.\\d+$" of kind "regex"
[transformers]
✔ Result correctly transformed from "v3.11.11" to "3.11.11"


CHANGELOG:
----------
no GitHub Release found for v3.11.11 on "https://github.com/python/cpython"

target: target#update_templates_json_python_3_12
----------------------------------------
✔ - all contents from 'file' and 'files' combined already up to date

target: target#update_templates_json_python_3_10
----------------------------------------
✔ - all contents from 'file' and 'files' combined already up to date

target: target#update_templates_json_python_3_11
----------------------------------------
✔ - all contents from 'file' and 'files' combined already up to date

target: target#run-make-build-python-repo
---------------------------------


#############
# SONARQUBE #
#############

source: source#sonarqube-version
------------------------
Searching for version matching pattern "^20[0-9]+\\.[0-9]+\\.[0-9]+-enterprise$"
✔ Docker Image Tag "2025.2.0-enterprise" found matching pattern "^20[0-9]+\\.[0-9]+\\.[0-9]+-enterprise$"
[transformers]
✔ Result correctly transformed from "2025.2.0-enterprise" to "2025.2.0"

target: target#production-version-kustomize
-----------------------------------
WARNING: branch "refs/heads/updatecli_main_0f1141ab4d9897068cb983a760b81fbe3f1efd0c2477d6576031712977a9fa4a" diverged from "refs/heads/main", resetting it to "refs/heads/main"
⚠ - change detected:
        * key "$.values.sonarqube.version" updated from "2025.1.0" to "2025.2.0", in file "clusters/eng-cdx-prod/namespaces/cdx/values.yaml"

target: target#staging-version-kustomize
--------------------------------
⚠ - change detected:
        * key "$.values.sonarqube.version" updated from "2025.1.0" to "2025.2.0", in file "clusters/eng-cdx-dev/namespaces/cdx/values.yaml"


###############
# SOURCEGRAPH #
###############

source: source#sourcegraph-version
--------------------------
WARNING: ⚠ No GitHub Release found, we fallback to published git tags
Searching for version matching pattern "latest"
✔ GitHub release version "v6.2.0" found matching pattern "latest" of kind "latest"
[transformers]
✔ Result correctly transformed from "v6.2.0" to "6.2.0"


CHANGELOG:
----------
no GitHub Release found for v6.2.0 on "https://github.com/sourcegraph/deploy-sourcegraph-k8s"

target: target#staging-version-kustomize
--------------------------------
✔ - no change detected:
        * key "$.values.sourcegraph.version" already set to "6.2.0", from file "clusters/eng-cdx-dev/namespaces/sourcegraph/values.yaml"

target: target#production-version-kustomize
-----------------------------------
✔ - no change detected:
        * key "$.values.sourcegraph.version" already set to "6.2.0", from file "clusters/eng-cdx-prod/namespaces/sourcegraph/values.yaml"


#############
# UPDATECLI #
#############

source: source#version
--------------
Searching for version matching pattern "*"
✔ GitHub release version "v0.97.0" found matching pattern "*" of kind "semver"
[transformers]
✔ Result correctly transformed from "v0.97.0" to "0.97.0"


CHANGELOG:
----------

Release published on the 2025-03-31 06:44:37 +0000 UTC at the url https://github.com/updatecli/updatecli/releases/tag/v0.97.0

## Changes

## 🚀 Features

- feat: Support key `title` for githubrelease source, condition @viccuad (#4528)

## 🧰 Maintenance

- deps(go): bump module golang.org/x/net to v0.38.0 @[updateclibot[bot]](https://github.com/apps/updateclibot) (#4540)
- deps(go): bump module github.com/testcontainers/testcontainers-go to v0.36.0 @[updateclibot[bot]](https://github.com/apps/updateclibot) (#4535)
- deps(github/action): bump all dependencies @[updateclibot[bot]](https://github.com/apps/updateclibot) (#4513)

## Contributors

@olblak, @updateclibot[bot], @viccuad and [updateclibot[bot]](https://github.com/apps/updateclibot)


target: target#update-version-updatecli
-------------------------------
✔ The line #19, matched by the keyword "ENV" and the matcher "UPDATECLI_VERSION", is correctly set to "ENV UPDATECLI_VERSION=0.97.0".
✔ - changed lines [] of file "/tmp/updatecli/stash/oci-cdx/updatecli/.templates/Dockerfile"

target: target#run-make-updatecli-repo
------------------------------


ACTIONS
========


argo-events
  => chore: bump argo-events to v1.9.5

No follow up action needed

argo-workflows
  => chore: bump argo-workflows to v3.6.5

WARNING: Git branch reset detected, the action must reset previous action description
✔ Nothing else to do, our pullrequest already exist on:
        https://bitbucket.acme.com/projects/CDX/repos/services/pull-requests/315

buf
  => chore: bump buf to v1.51.0

✔ Nothing else to do, our pullrequest already exist on:
        https://bitbucket.acme.com/projects/OCI-CDX/repos/build-go/pull-requests/96

curl
  => chore: bump curl to v8.13.0

No follow up action needed

dex
  => chore: bump dex to v2.42.0

WARNING: Git branch reset detected, the action must reset previous action description
ERROR: action stage:    "Please enter a value between 1 and 32768 characters"

go
  => chore: bump go to latest patch version

No follow up action needed
ERROR: 1 target(s) (run-make-build-go-repo) failed for action "pr-build-go-repo"

golangci-lint
  => chore: bump golanci-lint to v2.0.2

No follow up action needed

goreleaser
  => chore: bump goreleaser to v2.8.2

Bitbucket pullrequest successfully opened on "https://bitbucket.acme.com/projects/OCI-CDX/repos/build-go/pull-requests/99"

jfrog-cli
  => chore: bump jfrog-cli to v2.74.1

No follow up action needed

python
  => chore: bump python to latest patch version

No follow up action needed

sonarqube
  => chore: bump sonarqube to v2025.2.0

WARNING: Git branch reset detected, the action must reset previous action description
✔ Nothing else to do, our pullrequest already exist on:
        https://bitbucket.acme.com/projects/CDX/repos/services/pull-requests/319

sourcegraph
  => chore: bump sourcegraph to v6.2.0

No follow up action needed

updatecli
  => chore: bump updatecli to v0.97.0

✔ Nothing else to do, our pullrequest already exist on:
        https://bitbucket.acme.com/projects/OCI-CDX/repos/updatecli/pull-requests/8
ERROR: running actions:
errors occurred while running actions:
        * Please enter a value between 1 and 32768 characters

=============================

SUMMARY:



✔ argo-events:
        Source:
                ✔ [argo-events-version] Get latest version
        Target:
                ✔ [production-version-kustomize] Production Version Kustomize
                ✔ [staging-version-kustomize] Staging Version Kustomize


✔ buf:
        Source:
                ✔ [version] Get latest version
        Target:
                - [run-make-build-go-repo] 
                ✔ [update-version-build-go] Update version


✔ curl:
        Source:
                ✔ [version] Get latest version
        Target:
                - [run-make-ubuntu-repo] 
                ✔ [update-version-ubuntu] Update version


✔ go:
        Source:
                ✔ [latest_1_23] Retrieve latest Go 1.23.x version
                ✔ [latest_1_24] Retrieve latest Go 1.24.x version
        Target:
                - [run-make-build-go-repo] 
                ✔ [update_templates_json_go_1_23] Update templates.json GO_VERSION for 1.23.x
                ✔ [update_templates_json_go_1_24] Update templates.json GO_VERSION for 1.24.x


✔ jfrog-cli:
        Source:
                ✔ [version] Get latest version
        Target:
                - [run-make-build-go-repo] 
                ✔ [update-version-build-go] Update version


✔ python:
        Source:
                ✔ [latest_3_10] Retrieve latest Python 3.10.x version
                ✔ [latest_3_11] Retrieve latest Python 3.11.x version
                ✔ [latest_3_12] Retrieve latest Python 3.12.x version
                ✔ [latest_3_9] Retrieve latest Python 3.9.x version
        Target:
                - [run-make-build-python-repo] 
                ✔ [update_templates_json_python_3_10] Update templates.json PYTHON_VERSION for 3.10.x
                ✔ [update_templates_json_python_3_11] Update templates.json PYTHON_VERSION for 3.11.x
                ✔ [update_templates_json_python_3_12] Update templates.json PYTHON_VERSION for 3.12.x
                ✔ [update_templates_json_python_3_9] Update templates.json PYTHON_VERSION for 3.9.x


✔ sourcegraph:
        Source:
                ✔ [sourcegraph-version] Get latest version
        Target:
                ✔ [production-version-kustomize] Production Sourcegraph Version Kustomize
                ✔ [staging-version-kustomize] Staging Sourcegraph Version Kustomize


✔ updatecli:
        Source:
                ✔ [version] Get latest version
        Target:
                - [run-make-updatecli-repo] 
                ✔ [update-version-updatecli] Update version


⚠ argo-workflows:
        Source:
                ✔ [argo-workflows-version] Get latest version
        Target:
                ⚠ [production-version-kustomize] Production Version Kustomize
                ⚠ [staging-version-kustomize] Staging Version Kustomize


⚠ goreleaser:
        Source:
                ✔ [goreleaser-version] Get latest version
        Target:
                ⚠ [run-make-build-go-repo] Run Make
                ⚠ [update-version-build-go] Update GO Repo


⚠ sonarqube:
        Source:
                ✔ [sonarqube-version] Get latest version
        Target:
                ⚠ [production-version-kustomize] Production SonarQube Version Kustomize
                ⚠ [staging-version-kustomize] Staging SonarQube Version Kustomize


✗ dex:
        Source:
                ✔ [dex-version] Get latest version
        Target:
                ⚠ [production-version-kustomize] Production Version Kustomize
                ⚠ [staging-version-kustomize] Staging Version Kustomize


✗ golangci-lint:
        Source:
                ✔ [golangci-lint-version] Get latest golangci-lint version
        Target:
                ✗ [run-make-build-go-repo] Run Make
                ✔ [update-version-build-go] Update GO Repo


Run Summary
===========
Pipeline(s) run:
  * Changed:    3
  * Failed:     2
  * Skipped:    0
  * Succeeded:  10
  * Total:      15

5 action(s) to follow up:
  * https://bitbucket.acme.com/projects/OCI-CDX/repos/build-go/pull-requests/96
  * https://bitbucket.acme.com/projects/OCI-CDX/repos/updatecli/pull-requests/8
  * https://bitbucket.acme.com/projects/CDX/repos/services/pull-requests/315
  * https://bitbucket.acme.com/projects/OCI-CDX/repos/build-go/pull-requests/99
  * https://bitbucket.acme.com/projects/CDX/repos/services/pull-requests/319
ERROR: ✗ 2 over 15 pipeline failed
ERROR: command failed: 2 over 15 pipeline failed
```