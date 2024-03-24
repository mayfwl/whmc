// vite.config.ts
import { fileURLToPath, URL } from "node:url";
import { defineConfig } from "file:///D:/%E4%BD%9C%E4%B8%9A/whmc/whmc/node_modules/.pnpm/vite@5.1.4_@types+node@18.19.18_sass@1.71.1/node_modules/vite/dist/node/index.js";
import vue from "file:///D:/%E4%BD%9C%E4%B8%9A/whmc/whmc/node_modules/.pnpm/@vitejs+plugin-vue@4.6.2_vite@5.1.4_vue@3.4.19/node_modules/@vitejs/plugin-vue/dist/index.mjs";
import vueJsx from "file:///D:/%E4%BD%9C%E4%B8%9A/whmc/whmc/node_modules/.pnpm/@vitejs+plugin-vue-jsx@3.1.0_vite@5.1.4_vue@3.4.19/node_modules/@vitejs/plugin-vue-jsx/dist/index.mjs";
var __vite_injected_original_import_meta_url = "file:///D:/%E4%BD%9C%E4%B8%9A/whmc/whmc/vite.config.ts";
var vite_config_default = defineConfig({
  plugins: [vue(), vueJsx()],
  resolve: {
    alias: {
      "@": fileURLToPath(new URL("./src", __vite_injected_original_import_meta_url))
    },
    extensions: [".mjs", ".js", ".mts", ".ts", ".jsx", ".tsx", ".json"]
    //加入这段代码
  }
});
export {
  vite_config_default as default
};
//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAic291cmNlcyI6IFsidml0ZS5jb25maWcudHMiXSwKICAic291cmNlc0NvbnRlbnQiOiBbImNvbnN0IF9fdml0ZV9pbmplY3RlZF9vcmlnaW5hbF9kaXJuYW1lID0gXCJEOlxcXFxcdTRGNUNcdTRFMUFcXFxcd2htY1xcXFx3aG1jXCI7Y29uc3QgX192aXRlX2luamVjdGVkX29yaWdpbmFsX2ZpbGVuYW1lID0gXCJEOlxcXFxcdTRGNUNcdTRFMUFcXFxcd2htY1xcXFx3aG1jXFxcXHZpdGUuY29uZmlnLnRzXCI7Y29uc3QgX192aXRlX2luamVjdGVkX29yaWdpbmFsX2ltcG9ydF9tZXRhX3VybCA9IFwiZmlsZTovLy9EOi8lRTQlQkQlOUMlRTQlQjglOUEvd2htYy93aG1jL3ZpdGUuY29uZmlnLnRzXCI7aW1wb3J0IHsgZmlsZVVSTFRvUGF0aCwgVVJMIH0gZnJvbSAnbm9kZTp1cmwnXG5pbXBvcnQgeyBkZWZpbmVDb25maWcgfSBmcm9tICd2aXRlJ1xuaW1wb3J0IHZ1ZSBmcm9tICdAdml0ZWpzL3BsdWdpbi12dWUnXG5pbXBvcnQgdnVlSnN4IGZyb20gJ0B2aXRlanMvcGx1Z2luLXZ1ZS1qc3gnXG5cbi8vIGh0dHBzOi8vdml0ZWpzLmRldi9jb25maWcvXG5leHBvcnQgZGVmYXVsdCBkZWZpbmVDb25maWcoe1xuICBwbHVnaW5zOiBbdnVlKCksIHZ1ZUpzeCgpXSxcbiAgcmVzb2x2ZToge1xuICAgIGFsaWFzOiB7XG4gICAgICAnQCc6IGZpbGVVUkxUb1BhdGgobmV3IFVSTCgnLi9zcmMnLCBpbXBvcnQubWV0YS51cmwpKVxuICAgIH0sXG4gICAgZXh0ZW5zaW9uczogWycubWpzJywgJy5qcycsICcubXRzJywgJy50cycsICcuanN4JywgJy50c3gnLCAnLmpzb24nXSAvL1x1NTJBMFx1NTE2NVx1OEZEOVx1NkJCNVx1NEVFM1x1NzgwMVxuICB9XG59KVxuIl0sCiAgIm1hcHBpbmdzIjogIjtBQUF1UCxTQUFTLGVBQWUsV0FBVztBQUMxUixTQUFTLG9CQUFvQjtBQUM3QixPQUFPLFNBQVM7QUFDaEIsT0FBTyxZQUFZO0FBSDBILElBQU0sMkNBQTJDO0FBTTlMLElBQU8sc0JBQVEsYUFBYTtBQUFBLEVBQzFCLFNBQVMsQ0FBQyxJQUFJLEdBQUcsT0FBTyxDQUFDO0FBQUEsRUFDekIsU0FBUztBQUFBLElBQ1AsT0FBTztBQUFBLE1BQ0wsS0FBSyxjQUFjLElBQUksSUFBSSxTQUFTLHdDQUFlLENBQUM7QUFBQSxJQUN0RDtBQUFBLElBQ0EsWUFBWSxDQUFDLFFBQVEsT0FBTyxRQUFRLE9BQU8sUUFBUSxRQUFRLE9BQU87QUFBQTtBQUFBLEVBQ3BFO0FBQ0YsQ0FBQzsiLAogICJuYW1lcyI6IFtdCn0K
