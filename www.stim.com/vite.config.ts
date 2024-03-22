import path from "path"
import react from "@vitejs/plugin-react"
import tsconfigPaths from "vite-tsconfig-paths"

import { defineConfig } from "vite"
import { TanStackRouterVite } from "@tanstack/router-vite-plugin"

const testConfig = {
  test: {
    globals: true,
    environment: "jsdom",
    setupFiles: "./src/tests/setup.ts",
    mockReset: true,
  },
}

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react(), tsconfigPaths({}), TanStackRouterVite()],
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
  ...testConfig,
})
