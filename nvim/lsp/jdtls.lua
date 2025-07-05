local user_cache_dir = os.getenv("XDG_CACHE_HOME") or os.getenv("HOME") .. "/.cache"

return {
  cmd = { "jdtls", "-configuration", user_cache_dir .. "/jdtls/config", "-data", user_cache_dir .. "/jdtls/workspace" },
  filetypes = { "java" },
  init_options = {
    jvm_args = {},
    workspace = user_cache_dir .. "/jdtls/workspace"
  },
  root_markers = { ".git", "build.gradle", "build.gradle.kts", "build.xml", "pom.xml", "settings.gradle", "settings.gradle.kts" },
}
