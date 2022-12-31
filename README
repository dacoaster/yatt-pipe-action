# GitHub Action for [yatt-pipe](https://github.com/yatt-ai/yatt-pipe)

Please see the [yatt-pipe README](https://github.com/yatt-ai/yatt-pipe) for more information on configuring and using `yatt-pipe` in regards to what each of the variables are for.

Supported variables are:
- credentials
- ignore
- override
- source
- target
- data_types
- verbose
- no_git

Here is the simplest example of how to configure/use this action: 
```
run-tests:
  name: 'Running my tests and reporting results.'
  runs-on: ubuntu-latest
  steps:
  ...
  RUN YOUR TESTS HERE
  ...
  - uses: yatt-ai/yatt-pipe@main
    with:
      source: 'junit:${RESULTS_PATH}'
      target: 'yatt'
    env:
      YATT_TARGET_CREDENTIALS: ${{ secrets.YATT_CREDENTIALS }}
      RESULTS_PATH: './results.xml'

```
