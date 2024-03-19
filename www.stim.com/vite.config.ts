import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tsconfigPaths from "vite-tsconfig-paths";
import path from "path"

const testConfig = {
  test: {
    globals: true,
    environment: "jsdom",
    setupFiles: "./src/tests/setup.ts",
    mockReset: true,
  },
};

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react(), tsconfigPaths({})],
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
  ...testConfig,
});