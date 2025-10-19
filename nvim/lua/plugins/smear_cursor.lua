return {
  "sphamba/smear-cursor.nvim",
  opts = {
  -- 默认配置示例
  smear_between_buffers = true,  -- 缓冲区切换时拖尾
  smear_between_neighbor_lines = true,  -- 相邻行移动时拖尾
  scroll_buffer_space = true,  -- 滚动时在缓冲区空间绘制
  legacy_computing_symbols_support = true,  -- 支持旧字体符号
  transparent_bg_fallback_color = "#303030",  -- 透明背景阴影颜色
  -- 动画速度
  stiffness = 0.5,  -- 刚度
  trailing_stiffness = 0.5,  -- 尾迹刚度
  matrix_pixel_threshold = 0.5,  -- 像素阈值
    },
}
