# alpine-ruby-rake-azure
This docker contains

* ruby - 2.6.5
* alpine - 3.9
* terraform - 0.12.1
* rake
* rubocop
* mustache
* azure-cli

# Build

Build docker with

```
docker build -f Dockerfile -t alpine-ruby-rake-az-terraform-ansiable:2.6.5 .
```

# Usage

Use with volume containing the terraform, ansiable scripts
```
docker run --rm -it -v $space:/space alpine-ruby-rake-az-terraform-ansiable:2.6.5
```