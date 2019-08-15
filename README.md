1. Find and replace paths in current folder
```
find . -type f -exec sed -i 's,/home/chatforma/,/home/gitlab-runner/,g' {} +
```
2. Find text in path
```
grep -rnw '/path/to/somewhere/' -e 'pattern'
```
