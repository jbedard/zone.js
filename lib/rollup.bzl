load("@build_bazel_rules_nodejs//:defs.bzl", _rollup_bundle = "rollup_bundle")

def rollup_bundle(deps = [], **kwargs):
    "Set some defaults for our local rollup_bundle calls."
    _rollup_bundle(
        global_name = "Zone",
        deps = deps + [
            "//lib",
        ],
        license_banner = "//:angular_license.txt",
        **kwargs
    )
