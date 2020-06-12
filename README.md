# GitHub Action for `git diff --check`

This action executes `git diff --check` to warn if changes introduce conflict
markers or whitespace errors.

## Inputs

### `revision`

**Required** The first revision of a commit range. Default `HEAD^`.

## Example usage

uses: actions/git-diff-check@v1
