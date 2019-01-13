#include "OCPPreferenceController.h"
#import <spawn.h>

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
