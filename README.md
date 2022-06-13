# Close pull requests based on a label

This is an Action that closes pull requests based on the provided label.

## Usage

To test this GitHub Action, replace the `LABEL` variable with one you want to check an close on a regular cadence.

```yaml
on:
  schedule:
  - cron: "5 4 * * 0" # https://crontab.guru/#5_4_*_*_0
name: Weekly Pull Request Closure
jobs:
  weekly-pull-requests-close:
    runs-on: ubuntu-latest
    steps:
    - name: weekly-pull-requests-closure
      uses: kyslik/close-pull-requests-based-on-label@v1.0.0
      env:
        LABEL: stale
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
