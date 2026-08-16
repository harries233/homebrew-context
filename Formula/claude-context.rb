# Homebrew formula for claude-context
#
# 这是给 Homebrew tap 用的 formula。典型安装方式：
#   1. 把这个文件放进一个 tap 仓库（例如 harries233/homebrew-context 的 Formula/ 目录）
#   2. 用户在终端执行：
#        brew tap harries233/homebrew-context
#        brew install claude-context
#
# 首次打包前请完成两步：
#   - 在 GitHub 上给 claude-context-cli 打一个 release tag（如 v0.1.0）
#   - 用下面的命令算出 tarball 的真实 sha256 并替换 sha256 字段：
#       brew fetch --build-from-source --formula Formula/claude-context.rb
#     或
#       curl -sL https://github.com/harries233/claude-context-cli/archive/refs/tags/v0.1.0.tar.gz | shasum -a 256
class ClaudeContext < Formula
  desc "CLI to monitor Claude Code context usage from the terminal"
  homepage "https://github.com/harries233/claude-context-cli"
  url "https://github.com/harries233/claude-context-cli/archive/refs/tags/v0.1.0.tar.gz"
  # 占位符：发布 release 后用 `brew fetch` 得到真实值替换
  sha256 "REPLACE_WITH_SHA256"
  license "MIT"
  version "0.1.0"

  depends_on "node"

  def install
    # 脚本本身无构建步骤，直接安装到 bin/
    bin.install "bin/claude-context"
  end

  test do
    # 冒烟测试：确认命令能被调起并打印版本
    assert_match version.to_s, shell_output("#{bin}/claude-context --version")
  end
end
