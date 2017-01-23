# Sublime

## Package Control

[Install](https://packagecontrol.io/installation)

```
ctrl + `
```

```python
import urllib.request,os,hashlib; h = 'df21e130d211cfc94d9b0905775a7c0f' + '1e3d39e33b79698005270310898eea76'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```

启动按钮

`ctrl + shift + p`

## Git

## Markdown Editing

提供Markdown高亮效果

打开Preference Settings -> Markdown Editing --> Markdown GFM Settings-User输入以下配置。

```json
{
    "color_scheme": "Packages/MarkdownEditing/MarkdownEditor-Dark.tmTheme"
}
```