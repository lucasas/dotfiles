#!/usr/bin/env bash

# Exit on error. Append "|| true" if you expect an error.
set -o errexit
# Exit on error inside any functions or subshells.
set -o errtrace
# Do not allow use of undefined vars. Use ${VAR:-} to use an undefined VAR
set -o nounset
# Catch the error in case first pipe command fails (but second succeeds)
set -o pipefail

__script_dir="$(cd "$(dirname "${BASH_SOURCE[${__b3bp_tmp_source_idx:-0}]}")" && pwd)"

# Configuration
trackpad=false # there is a trackpad in this computer?
apple_language="en" # system language

# Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# `Inches`, `en_GB` with `en_US`, and `true` with `false`.
apple_locale="pt_BR@currency=USD"
apple_measurement_units="Centimeters"
apple_metric_units=true
timezone="America/Sao_Paulo"

# include some helpers
source ./sh/helpers.sh
source ./sh/echos.sh

bot "Hi! I'm going to install some packages and tweak your system settings."

# Ask for the administrator password upfront
ask_admin_password

# ensure homebrew is installed
ensure_homebrew_is_installed

# install brew (and cask) packages defined in `Brewfile`
brew_bundle

# install npm global packages defined in npm_globals.txt
npm_global_install

# run some MacOS tweaks
macos_tweaks

# initialize / updates submodules
init_submodules

# symlink dotfiles
do_symlink

# run homebrew cleanup
homebrew_cleanup

# copying other files
copy_other_files

bot "All done! You might need to restart now :)"
