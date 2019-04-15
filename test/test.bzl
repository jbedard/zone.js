load("@npm_bazel_typescript//:defs.bzl", "ts_library")

test_deps = [
    "test/wtf_mock",
    "test/test_fake_polyfill",
    "lib/zone",
    "lib/common/promise",
    "test/main",
]

def get_web_test_deps():
    web_test_deps = []
    for test_dep in test_deps:
         web_test_deps.append(":" + test_dep)
         ts_library(
             name = test_dep,
             testonly = 1,
             srcs = [
                 test_dep + ".ts"
             ],
             deps = [
                 ":test_lib"
             ]
        )
