[private]
default:
  @just --list

# tag and release the action
release bump='patch':
    #!/usr/bin/env bash
    set -euo pipefail

    git checkout main > /dev/null 2>&1
    git diff-index --quiet HEAD || (echo "Git directory is dirty" && exit 1)

    version=$(semver bump {{bump}} $(git tag --sort=v:refname | tail -1 || echo "v0.0.0"))
    tag="v${version}"

    echo "Tagging action with version ${version}"
    read -n 1 -p "Proceed (y/N)? " answer
    echo

    case ${answer:0:1} in
        y|Y )
        ;;
        * )
            echo "Aborting"
            exit 1
        ;;
    esac

    major=v$(semver get major $version)

    git tag -m "Release ${version}" $tag
    git tag -f -m "Moving tag ${major}" $major

    git push origin $tag
    git push -f origin $major
