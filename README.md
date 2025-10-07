# Octoslash GitHub Action

This is a GitHub Action to run [octoslash](https://github.com/sagikazarmark/octoslash),
allowing you to run slash commands from issues and pull requests.

## Usage

Create a new file named `octoslash.yml` in the `.github/workflows` directory of your repository:

```yaml
name: Octoslash

on: issue_comment

permissions:
  issues: write
  # pull-requests: write

jobs:
  run:
    name: Run
    runs-on: ubuntu-latest
    steps:
      # This is optional, but recommended
      # Otherwise octoslash fetches the required files using the GitHub API
      # which may result in slower performance
      - name: Checkout repository
        uses: actions/checkout@11bd71901bbe5b1630ceea73d27597364c9af683 # v4.2.2

      - name: Octoslash
        uses: sagikazarmark/octoslash-action@v0
        # with:
        #   version: v0.1.0

        #   # Custom github token
        #   token: ${{ secrets.CUSTOM_GITHUB_TOKEN }}
```

## License

The project is licensed under the [MIT License](LICENSE).
