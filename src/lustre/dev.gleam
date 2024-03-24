// IMPORTS ---------------------------------------------------------------------

import argv
import glint
import lustre_dev_tools/cli/add
import lustre_dev_tools/cli/build
import lustre_dev_tools/cli/start

// MAIN ------------------------------------------------------------------------

pub fn main() {
  let args = argv.load().arguments

  glint.new()
  |> glint.as_gleam_module
  |> glint.with_name("lustre/dev")
  |> glint.with_pretty_help(glint.default_pretty_help())
  |> glint.add(at: ["add", "esbuild"], do: add.esbuild())
  |> glint.add(at: ["add", "tailwind"], do: add.tailwind())
  |> glint.add(at: ["build", "app"], do: build.app())
  |> glint.add(at: ["build", "component"], do: build.component())
  |> glint.add(at: ["start"], do: start.run())
  |> glint.run(args)
}