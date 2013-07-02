-(void) customBackBarButtonItem{
  [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil]

     setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],UITextAttributeTextColor, // change text color
 [UIColor clearColor], UITextAttributeTextShadowColor,//change the text shadow color
 nil] forState:UIControlStateNormal];
}
