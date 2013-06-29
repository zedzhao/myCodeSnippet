//
//  FlowLayout.m
//  zTimer
//
//  Created by Kun on 13-6-5.
//  Copyright (c) 2013年 Kun. All rights reserved.
//

#import "FlowLayout.h"

#define  ACTIVE_DISTANCE 90
#define  ZOOM_FACTOR 0.3

@implementation FlowLayout

-(id)init{
    self = [super init];
    if (self) {
        self.itemSize = CGSizeMake(90, 90);
        self.sectionInset = UIEdgeInsetsMake(40, 20,40, 20);
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.minimumInteritemSpacing = 20;
    }
    return  self;
}


-(BOOL) shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
    
    for(UICollectionViewLayoutAttributes *attributes in array){
        if (CGRectIntersectsRect(attributes.frame, rect)) {
            CGFloat distance = CGRectGetMidX(visibleRect) - attributes.center.x;
            CGFloat normalizedDistance = distance /ACTIVE_DISTANCE;
            
            if(ABS(distance) < ACTIVE_DISTANCE){
                CGFloat zoom = 1 + ZOOM_FACTOR*(1-ABS(normalizedDistance));
                attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0);
                attributes.zIndex = 1;
            }
        }
    }
    
    return array;
}

-(CGPoint) targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    
    CGFloat offsetAdjustment = MAXFLOAT;
    CGFloat horizontalCenter = proposedContentOffset.x + (CGRectGetWidth(self.collectionView.bounds)/2.0);
    
    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0.0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    
    NSArray *array = [super layoutAttributesForElementsInRect:targetRect];
    
    for(UICollectionViewLayoutAttributes* layoutAttributes in array){
        CGFloat itemHorizontalCenter = layoutAttributes.center.x;
        if (ABS(itemHorizontalCenter - horizontalCenter) < ABS(offsetAdjustment)) {
            offsetAdjustment = itemHorizontalCenter - horizontalCenter;
        }
    }
    return CGPointMake(proposedContentOffset.x-offsetAdjustment, proposedContentOffset.y);
}

@end
