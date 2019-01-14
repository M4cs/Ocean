#import <Headers/Interfaces.h>
#import <Headers/TranslateString.h>

%group GoogleTranslate
%hook PackageCollectionViewCell
-(void)layoutSubviews {
    %orig;
    if ([self valueForKey:@"_descriptionLabel"]) {
        UILabel *descriptionLabel = (UILabel *)([self valueForKey:@"_descriptionLabel"]);
        descriptionLabel.text = [descriptionLabel.text googleTranslate];
    }
}
%end
%end

%ctor {
    if ([prefs boolForKey:@"googleTranslate"]) {
        %init(GoogleTranslate);
    }
}
