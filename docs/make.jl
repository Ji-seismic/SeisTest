using Documenter
using SeisTest
using Pkg
Pkg.add("SeisProcessing")
Pkg.add("DSP")
Pkg.add("SeisPlot")
makedocs(
    sitename = "SeisTest",
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing)== "true"),
    modules = [SeisTest],
	pages = [
          "Home" => "index.md",
		  "Library" => Any[
 	 			"Public" => "public.md",
 	 ],
	      "Example"=>"example.md",
		  "Publication"=>"publication.md"
		],
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(repo = "github.com/Ji-seismic/SeisTest.git")
