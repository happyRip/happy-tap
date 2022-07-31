class Undollar < Formula
  desc "Execute any shell command despite having a dollar sign at the beginning of the line."
  homepage "https://github.com/happyRip/undollar"
  url "https://github.com/happyRip/undollar/archive/refs/tags/v0.0.1-alpha.tar.gz"
  sha256 "81398c488e98ba3a2234527e4a5f073265f4d000ff827eb13f64e2908dd40cd6"
  license "AGPL-3.0"

  def install
    bin.install "bin/undollar.sh" => "$"
  end

  test do
    (testpath/"hello.sh").write <<~EOS
      echo 'Hello, undollar!'
    EOS

    assert_equal "Hello, undollar!\n", shell_output("#{bin}/$ sh hello.sh")
  end
end
