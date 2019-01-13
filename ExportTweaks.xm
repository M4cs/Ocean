#import <Headers/Interfaces.h>

%group ExportTweaks
%hook PackageListViewController
- (void)viewDidLoad{
	%orig;
    if ([self.title isEqualToString:@"Packages"]) {
        UIBarButtonItem *exportButton([[UIBarButtonItem alloc] initWithTitle:@"Export" style:UIBarButtonItemStylePlain target:self action:@selector(exportButtonClicked:)]);
        [[self navigationItem] setLeftBarButtonItem:exportButton];
    }
}

%new
-(void)exportButtonClicked:(UIButton*)button{
	UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Export"
                           message:@"Would you like to save your package list? This will copy each package and its corresponding version to your clipboard."
                           preferredStyle:UIAlertControllerStyleAlert];

	UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Copy" style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {[self copyPackages];}];
	UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel
                               handler:^(UIAlertAction * action) {}];

	[alert addAction:defaultAction];
	[alert addAction:cancelAction];
	alert.view.tintColor = [prefs colorForKey:@"tintColor"];
	[self presentViewController:alert animated:YES completion:nil];
}
%new
-(void)copyPackages {
		NSMutableString *bodyFromArray = [[NSMutableString alloc] init];
		NSArray *packages = MSHookIvar<NSArray *>(self, "_packages");
		for (Package* object in packages)
		{
			NSString *packageName = MSHookIvar<NSString *>(object, "_name");
			NSString *packageVersion = MSHookIvar<NSString *>(object, "_version");
			[bodyFromArray appendString:[NSString stringWithFormat:@"%@: %@\n", packageName, packageVersion]];
		}
		[bodyFromArray deleteCharactersInRange:NSMakeRange([bodyFromArray length]-1, 1)];
		UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
		pasteboard.string = bodyFromArray;
}
%end
%end

%ctor {
	if ([prefs boolForKey:@"exportBtn"]) {
		%init(ExportTweaks);
	}
}
