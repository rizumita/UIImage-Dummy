UIImage-Dummy
=============
UIImage+Dummy category provides method to create dummy image for iOS 6.0+.

![Screenshot](https://raw2.github.com/rizumita/UIImage-Dummy/master/screenshot.png)

Usage
----------
```Objective-C
UIImage *image1 = [UIImage imageNamed:@"dummy.150x200"];
UIImage *image2 = [UIImage imageNamed:@"dummy.150x200.#407EFF"];
UIImage *image3 = [UIImage imageNamed:@"dummy.150x200.blue"];
UIImage *image3 = [UIImage imageNamed:@"dummy.150x200.blue..image.png"];	// If 'image.png' exists, 'image.png' UIImage object is created. If not exist, dummy UIImage object is created.
```

License
----------
MIT license
