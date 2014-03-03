# FMSKit

# FMSDrawer Usage
```
// AppDelegate.m
_drawer = [FMSDrawer sharedInstance];
[_drawer setDataSource:self];
[_drawer setDelegate:self];
[_drawer setParentView:(UINavigationController *)_window.rootViewController];
```
