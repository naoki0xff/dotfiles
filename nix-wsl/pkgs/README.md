## Enable cgroup v2 for WSL

You need to configure %UserProfile%\.wslconfig to disable cgroup v1 hierarchies.

```
[wsl2]
kernelCommandLine = cgroup_no_v1=all
```

See [wslconfig](https://learn.microsoft.com/en-us/windows/wsl/wsl-config#wslconfig) for configure global wsl options.

Further reading [About cgroup v2](https://kubernetes.io/docs/concepts/architecture/cgroups/)
