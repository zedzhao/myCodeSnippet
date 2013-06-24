-(void) addGradient:(UIButton *) btn color:(CGColorRef)colorRef {
    
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    
    CAGradientLayer *btnGradient = [CAGradientLayer layer];
    btnGradient.frame = btn.bounds;

    
    [[btn layer] setBackgroundColor:[UIColor darkGrayColor].CGColor];
    CAGradientLayer *glossLayer = [CAGradientLayer layer];
    glossLayer.frame = btn.bounds;
    glossLayer.colors = [NSArray arrayWithObjects:
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:0.75f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:0.4f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,                         nil];
    glossLayer.locations = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:0.0f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.5f],          
                            [NSNumber numberWithFloat:0.8f],
                            [NSNumber numberWithFloat:1.0f],
                            nil];
    [btn.layer insertSublayer:glossLayer atIndex:0];
    
    CALayer *btnLayer = [btn layer];
    [btnLayer setMasksToBounds:YES];
    
    UIColor*mycolor = btn.backgroundColor;
    [btn.layer setBorderColor:[mycolor CGColor]];
    [[btn layer] setBorderWidth:2.0f];
    [[btn layer] setCornerRadius:10.0f];
}

