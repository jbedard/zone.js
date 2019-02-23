load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
    name = "build_bazel_rules_nodejs",
    urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/0.18.7/rules_nodejs-0.18.7.tar.gz"],
    sha256 = "a69c5bd317beef982298ea7b5ed8b5c5275d1b55ee199e98a0ca088f8e0c6cce",
)

load("@build_bazel_rules_nodejs//:defs.bzl", "yarn_install")
yarn_install(
    name = "npm",
    package_json = "//:package.json",
    yarn_lock = "//:yarn.lock",
    exclude_packages = [
        # TODO: fails because it tries to install itself elsewhere on disk:
        # chmod failed: phantomjs was not successfully copied to /private/var/tmp/_bazel_alexeagle/4c250a9222a7d404c4ee9b5274a7162a/external/npm/node_modules/phantomjs-prebuilt/lib/phantom/bin/phantomjs 
        "phantomjs",
    ],
)

load("@npm//:install_bazel_dependencies.bzl", "install_bazel_dependencies")
install_bazel_dependencies()
