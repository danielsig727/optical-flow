
package = "opticalflow"
version = "1.0-1"

source = {
   url = "git://github.com/danielsig727/optical-flow.git"
}

description = {
   summary = "This is a simple wrapper around the optical-flow algorithm developped/published by C.Liu",
   detailed = [[
   Eventually could become a wrapper for more algorithms but for now just:

   C. Liu. Beyond Pixels: Exploring New Representations and Applications
   for Motion Analysis. Doctoral Thesis. Massachusetts Institute of 
   Technology. May 2009.

   More at: http://people.csail.mit.edu/celiu/OpticalFlow/
   ]],
   homepage = "",
   license = "MIT/X11" -- or whatever you like
}

dependencies = {
   "lua >= 5.1",
   "torch",
   "xlua"
}

build = {
   type = "cmake",

   cmake = [[
cmake -E make_directory build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$(LUA_BINDIR)/.." -DCMAKE_INSTALL_PREFIX="$(PREFIX)" && $(MAKE)
   ]],

   variables = {
      CMAKE_INSTALL_PREFIX = "$(PREFIX)"
   }
}
