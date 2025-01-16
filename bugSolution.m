The solution involves avoiding the premature release of `myArray`. The `myArray` should be released when it is no longer needed outside of `someMethod`, so the following fix avoids the dangling pointer problem:

```objectivec
@property (strong, nonatomic) NSMutableArray *myArray;

- (void)someMethod {
    [myArray addObject:@"New Object"];
    // myArray = nil; //Removed this line
}

- (void)dealloc{
    self.myArray = nil;
}
```

By removing the line that sets `myArray` to `nil` inside `someMethod`, the array's lifecycle is managed correctly by ARC. The `myArray` is released in the `dealloc` method of the class, which is the correct way to release instance variables.  This ensures that the added object's reference is properly handled, preventing crashes and data loss.