load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "3a3efbf223f6de733475602844ad3a8faa02abda25ab8cfe1d1ed0db134887cf",
    urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/0.27.12/rules_nodejs-0.27.12.tar.gz"],
)

load("@build_bazel_rules_nodejs//:defs.bzl", "yarn_install")

yarn_install(
    name = "npm",
    exclude_packages = [
        # Don't need to run Bazel under Bazel
        "@bazel/bazel",
        "@bazel/ibazel",
        "@bazel/buildifier",
        # TODO: fails because it tries to install itself elsewhere on disk:
        # chmod failed: phantomjs was not successfully copied to /private/var/tmp/_bazel_alexeagle/4c250a9222a7d404c4ee9b5274a7162a/external/npm/node_modules/phantomjs-prebuilt/lib/phantom/bin/phantomjs
        # "phantomjs",
    ],
    package_json = "//:package.json",
    yarn_lock = "//:yarn.lock",
)

load("@npm//:install_bazel_dependencies.bzl", "install_bazel_dependencies")
install_bazel_dependencies()

load("@npm_bazel_karma//:package.bzl", "rules_karma_dependencies")
rules_karma_dependencies()

load("@io_bazel_rules_webtesting//web:repositories.bzl", "web_test_repositories")
web_test_repositories()

load("@npm_bazel_karma//:browser_repositories.bzl", "browser_repositories")
browser_repositories()
