name: Release


on:
  push

env:
  # Setting an environment variable with the value of a configuration variable
  GH_TOKEN: ${{ vars.GH_TOKEN }}
jobs:
  release:
    runs-on: ${{ matrix.os }}

    strategy:
      matrix:
        os: [windows-latest]

    steps:
      - name: Check out Git repository
        uses: actions/checkout@v3
        with:
          submodules: "recursive"

      - name: Install Node.js, NPM and Yarn
        uses: actions/setup-node@v3
        with:
          node-version: 16
          cache: 'yarn'

      - name: Install Deps
        run: yarn

      - name: Build
        run: yarn build

      - name: List
        run: tree /f

      # - uses: zattoo/publish@v1
      #   with:
      #     github_token: ${{github.token}}
      #     sources: 'build/*setup*.*'

      - uses: actions/upload-artifact@v3
        with:
          name: DesktopSchedule-mac
          path: build/*-universal.dmg
          if-no-files-found: ignore

      - uses: actions/upload-artifact@v3
        with:
          name: DesktopSchedule-win
          path: build/*Setup*.exe
          if-no-files-found: ignore

      - uses: actions/upload-artifact@v3
        with:
          name: DesktopSchedule-linux
          path: build/*.deb
          if-no-files-found: ignore