# GitHub Action for [yatt-pipe](https://github.com/yatt-ai/yatt-pipe)

Please see the [yatt-pipe README](https://github.com/yatt-ai/yatt-pipe) for more information on configuring and using `yatt-pipe`.

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

CTODO - If you are looking to upload test data from a previous job, you'll need to use the [upload artifact](https://github.com/actions/upload-artifact) and [download artifact](https://github.com/actions/download-artifact) actions to persist the test results.  (Alternatively, you could also use `yatt-pipe` directly by installing it in your project and running it immediately after your tests.)

