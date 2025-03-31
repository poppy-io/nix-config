default: upbuild

build:
  nh os switch .

debug:
  nh os switch . --verbose

up:
  nix flake update

upbuild:
  nh os switch . --update --ask

ask:
  nh os switch . --ask

history:
  nix profile history --profile /nix/var/nix/profiles/system

repl:
  nh os repl .

clean:
  # remove all generations older than 7 days
  nh clean all --keep-since 7d

gc:
  # garbage collect all unused nix store entries
  nix-collect-garbage --delete-old
