In Objective-C, a common yet subtle error arises when dealing with memory management using ARC (Automatic Reference Counting).  Consider this scenario:

```objectivec
@property (strong, nonatomic) NSMutableArray *myArray;

- (void)someMethod {
    [myArray addObject:@"New Object"];
    myArray = nil; //Error
}
```

While seemingly innocuous, setting `myArray` to `nil` after adding an object can lead to unexpected crashes or data loss. Because the added object retains a reference to `myArray`, prematurely releasing `myArray` causes a dangling pointer which might crash the application unexpectedly.