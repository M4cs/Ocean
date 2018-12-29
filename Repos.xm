#import <Headers/Interfaces.h>
#import <Headers/NSString+URLsFromString.h>

%hook SourcesViewController

- (void)presentAddSourceSkippingPasteboard:(BOOL)skippingPasteboard{
    RepoManager *manager = [%c(RepoManager) sharedInstance];
    NSMutableArray<NSURL *> *URLs = [[[UIPasteboard generalPasteboard].string URLs] mutableCopy];
    NSMutableArray *discardedItems = [NSMutableArray array];
    for (NSURL *tempObject in URLs) {
        if([manager hasRepoWithURL:tempObject]){
            [discardedItems addObject:tempObject];
        }
    }
    if(discardedItems.count){
        [URLs removeObjectsInArray:discardedItems];
    }
    if (!skippingPasteboard && URLs.count){

        UIAlertController *autoPasteboardSourceController = [UIAlertController alertControllerWithTitle:@"Automatically Add Source?" message:nil preferredStyle:UIAlertControllerStyleAlert];
        autoPasteboardSourceController.message = [NSString stringWithFormat: @"Add the following URL found on your pasteboard: \r%@", [[URLs valueForKey:@"description"] componentsJoinedByString:@"\r"]];

        UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"Add Source" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            [manager addReposWithURLs:URLs];
            [self refreshSources:nil];    
            [self setEditing:NO animated:YES];  
        }];
        UIAlertAction *notUsed = [UIAlertAction actionWithTitle:@"Enter Manually" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
            [self presentAddSourceSkippingPasteboard:YES];
        }];
            
            
        [autoPasteboardSourceController addAction:notUsed];
        [autoPasteboardSourceController addAction:confirm];
        [self presentViewController:autoPasteboardSourceController animated:YES completion:nil];
        return;
        

    }else{
        %orig;
    }
}
%end 