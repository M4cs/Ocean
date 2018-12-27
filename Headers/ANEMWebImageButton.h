@class NSURL, UIActivityIndicatorView;

@interface ANEMWebImageButton : UIButton
{
    NSURL *_imageURL;
    double _imageScale;
    UIActivityIndicatorView *_loadingIndicator;
}

@property(nonatomic) double imageScale; // @synthesize imageScale=_imageScale;
@property(retain, nonatomic) NSURL *imageURL; // @synthesize imageURL=_imageURL;
- (void)layoutSubviews;
- (void)loadImage;
- (void)stopLoading;
- (id)initWithFrame:(struct CGRect)arg1;

@end

