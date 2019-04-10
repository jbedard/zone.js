def umd_bundle_names(names):
  umd_names = []
  for name in names:
    umd_names.append(":" + name + ".umd.js")
  return umd_names
