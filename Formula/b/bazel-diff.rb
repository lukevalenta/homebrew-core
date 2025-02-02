class BazelDiff < Formula
  desc "Performs Bazel Target Diffing between two revisions in Git"
  homepage "https://github.com/Tinder/bazel-diff/"
  url "https://github.com/Tinder/bazel-diff/releases/download/6.0.0/bazel-diff_deploy.jar"
  sha256 "dc743227e3becc925eb3cb3398360d4c29b4d8cb08fbc583849f090dde7e049a"
  license "BSD-3-Clause"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "26a2a0711d1215a73c4319a3003f1d0526fac1139b10c391ef04050e07220868"
  end

  depends_on "bazel" => :test
  depends_on "openjdk"

  def install
    libexec.install "bazel-diff_deploy.jar"
    bin.write_jar_script libexec/"bazel-diff_deploy.jar", "bazel-diff"
  end

  test do
    output = shell_output("#{bin}/bazel-diff generate-hashes --workspacePath=#{testpath} 2>&1", 1)
    assert_match "Unexpected error during generation of hashes", output
  end
end
