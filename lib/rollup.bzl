load("@build_bazel_rules_nodejs//:defs.bzl", "rollup_bundle")

def rollup_macro(name, entry_point):
  rollup_bundle(
    name = name,
    entry_point = entry_point,
    deps = [":lib"],
    license_banner = "//:angular_license.txt",
  )
