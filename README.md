1. Find and replace paths in current folder
```
find . -type f -exec sed -i 's,/home/chatforma/,/home/gitlab-runner/,g' {} +
```
2. Find text in path
```
grep -rnw '/path/to/somewhere/' -e 'pattern'
```
3. Kubernetes: port-forward with 0.0.0.0
```
kubectl --namespace storageos port-forward svc/storageos 5705 --address 0.0.0.0

```
