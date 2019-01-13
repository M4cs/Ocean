#include "OCPPreferenceController.h"
#import <spawn.h>

#define screenWidth [[UIScreen mainScreen] bounds].size.width

@implementation OCPPreferenceController
-(void)viewDidLoad {
    [super viewDidLoad];

    //add apply button to nav bar
    UIBarButtonItem* applyBtn = [[UIBarButtonItem alloc]  initWithTitle:@"Apply" style:UIBarButtonItemStylePlain target:self action:@selector(apply)];
    [self.navigationItem setRightBarButtonItem:applyBtn];
}

-(void)apply {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Apply changes?" message:@"This will restart Sileo" preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        pid_t pid;
        int status;
        const char* args[] = {"killall", "-9", "Sileo", NULL};
        posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
        waitpid(pid, &status, WEXITED);
    }];
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}
@end

//banner
@implementation OCPPrefBannerCell
-(id)initWithSpecifier:(PSSpecifier *)specifier
{
	self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
	if (self)
	{
        UIImage* img = [UIImage imageNamed:@"Banner" inBundle:[NSBundle bundleForClass:[self class]]];
		imgView = [[UIImageView alloc] init];
        imgView.frame = CGRectMake(0, -self.frame.origin.y, screenWidth, screenWidth * (img.size.height / img.size.width));
        imgView.image = img;
        imgView.backgroundColor = [UIColor redColor];
        [self addSubview:imgView];
	}
	return self;
}

-(void)didMoveToWindow {
    [super didMoveToWindow];
    imgView.frame = CGRectMake(0, -self.frame.origin.y, screenWidth, imgView.frame.size.height);
}

-(CGFloat)preferredHeightForWidth:(CGFloat)arg1
{
    return imgView.frame.size.height - 35;
}
@end
