Git强制提交覆盖

```shell
git reflog expire --expire=now --all
git gc --prune=now
git push --all --force
git push --all --tags --force
```

[Git清除历史纪录](https://segmentfault.com/q/1010000004996998)