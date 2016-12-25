Git强制提交覆盖

```shell
git reflog expire --expire=now --all
git gc --prune=now
git push --all --force
git push --all --tags --force
```