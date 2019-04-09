load("@build_bazel_rules_nodejs//:defs.bzl", "rollup_bundle")

def rollup_macro(name, entry_point):
  origin_name = name
  # replace '-' with empty to avoid illegal js bundle name error in rollup
  name = name.replace("-", "")

  # generate rollup bundle based on the name without '-'
  rollup_bundle(
    name = name,
    entry_point = entry_point,
    deps = [":lib"],
    license_banner = "//:angular_license.txt",
  )

  # the name contains -, so we need to copy the output from rollup to the name contains '-'
  if name != origin_name:
    native.genrule(
      name = origin_name + "copy",
      srcs = [name],
      outs = [origin_name + ".js"],
      cmd = "echo $(OUTS)",
    )
