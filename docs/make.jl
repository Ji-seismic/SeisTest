using Documenter
using SeisTest

makedocs(
    sitename = "SeisTest",
    format = Documenter.HTML(),
    modules = [SeisTest]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(repo = "github.com/Ji-seismic/SeisTest.git")
