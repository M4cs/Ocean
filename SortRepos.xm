#import <Headers/Interfaces.h>

static void sortRepos(NSMutableArray<Repo*>* __strong& repos)
{
    repos = [[repos sortedArrayUsingComparator:^NSComparisonResult(Repo* a, Repo* b) {
        NSString* first = a.repoName;
        NSString* second = b.repoName;
        return [[first lowercaseString] compare:[second lowercaseString]];
    }] mutableCopy];
}

%group SortRepos
%hook RepoManager
-(void)updateWithCompletion:(void (^)(id))arg1 forceUpdate:(BOOL)arg2 forceReload:(BOOL)arg3
{
    void (^oldArg1)(id) = arg1;
    arg1 = ^(id i){
        oldArg1(nil);
        NSMutableArray<Repo*>* __strong& repos = MSHookIvar<NSMutableArray<Repo*>*>(self, "_repoList");
        sortRepos(repos);
    };
    %orig;
}
%end
%end

%ctor {
    if ([prefs boolForKey:@"sortRepos"]) {
        %init(SortRepos);
    }
}
