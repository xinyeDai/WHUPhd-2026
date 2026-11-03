# 图片目录

将自行拥有或获得授权的科研图片放在这里，在正文中使用相对路径引用，例如：

```latex
\includegraphics[width=0.85\textwidth]{figures/my-figure.pdf}
```

默认示例使用 TikZ 和 TeX 发行版 `mwe` 宏包提供的占位图，因此此目录不需要包含实际图片即可编译。科研曲线优先输出嵌入字体的矢量 PDF；Matplotlib 可设置 `pdf.fonttype = 42`。导出后检查实际字体嵌入及文字显示。点云和照片可使用足够分辨率的 PNG/JPEG。
