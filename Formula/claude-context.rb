# Homebrew formula for claude-context
#
# 这是给 Homebrew tap 用的 formula。典型安装方式：
#   1. 把这个文件放进一个 tap 仓库（例如 harries233/homebrew-context 的 Formula/ 目录）
#   2. 用户在终端执行：
#        brew tap harries233/homebrew-context
#        brew install claude-context
#
# 更新：改 claude-context-cli 后打新 tag，重算 sha256 替换下方字段即可。
class ClaudeContext < Formula
  desc "CLI to monitor Claude Code context usage from the terminal"
  homepage "https://github.com/harries233/claude-context-cli"
  url "https://github.com/harries233/claude-context-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "03bfa14e0e5bc57beeb7fe2328a4d6643d7ae4ba2ee413200f96228cbd01dae0"
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
